import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/reservation/buyer_model.dart';
import 'package:hotels_exploration/domain/models/reservation/i_reservation_repository.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
import 'package:hotels_exploration/domain/models/reservation/tourist_model.dart';
import 'package:hotels_exploration/views/routes/router.gr.dart';
import 'package:injectable/injectable.dart';

part 'reservation_ui_logic_event.dart';

part 'reservation_ui_logic_state.dart';

part 'reservation_ui_logic_bloc.freezed.dart';

@injectable
class ReservationUiLogicBloc
    extends Bloc<ReservationUiLogicEvent, ReservationUiLogicState> {
  ReservationUiLogicBloc(this._iReservationRepository)
      : super(const ReservationUiLogicState.initial()) {
    on<ReservationUiLogicEvent>(
      (ReservationUiLogicEvent event,
          Emitter<ReservationUiLogicState> emit) async {
        await event.map(
          getReservationData: (_GetReservationDataEvent event) async {
            getLogger().i('getReservationData Started');
            emit(const ReservationUiLogicState.loading());
            final Either<ModelsFailure, ReservationModel> failureOrSuccess =
                await _iReservationRepository.fetchReservationData();
            ReservationUiLogicState reservationUiLogicState =
                failureOrSuccess.fold(
              (ModelsFailure failure) {
                return ReservationUiLogicState.actionFailure(failure);
              },
              (ReservationModel reservationModel) {
                return ReservationUiLogicState.actionSuccess(reservationModel,
                    buyerInfoFormKey: GlobalKey<FormState>(),
                    touristsInfoFormKey: [GlobalKey<FormState>()],
                    touristList: [TouristModel.empty]);
              },
            );
            emit(reservationUiLogicState);
          },
          buyerInformationFormChanged:
              (_BuyerInformationFormChangedEvent event) async {
            getLogger().i('buyerInformationFormChanged Started');
            if (state is! _ActionSuccess) return;
            _ActionSuccess currentState = state as _ActionSuccess;
            emit(currentState.copyWith(buyerModel: event.buyerModel));
          },
          addNewTouristPressed: (_AddNewTouristPressedEvent event) async {
            getLogger().i('addNewTouristPressed Started');
            if (state is! _ActionSuccess) return;
            _ActionSuccess currentState = state as _ActionSuccess;
            List<GlobalKey<ExpansionTileCustomState>> itemKeys = [
              ...currentState.itemKeys ?? []
            ];
            List<bool> isExpandedList = [
              ...currentState.isExpandedList ?? [false]
            ];
            List<TouristModel?> touristList = [...currentState.touristList];
            List<GlobalKey<FormState>> touristsInfoFormKey = [
              ...currentState.touristsInfoFormKey
            ];
            if (itemKeys.length <= 8) {
              final newKey = GlobalKey<ExpansionTileCustomState>();
              final newFormKey = GlobalKey<FormState>();
              itemKeys.add(newKey);
              isExpandedList.add(false);
              touristList.add(TouristModel.empty);
              touristsInfoFormKey.add(newFormKey);
              emit(currentState.copyWith(
                itemKeys: itemKeys,
                isExpandedList: isExpandedList,
                touristList: touristList,
                touristsInfoFormKey: touristsInfoFormKey,
              ));
            } else {
              getLogger().e('Maximum is 10 no more ');
            }
          },
          expansionChanged: (_ExpansionChangedEvent event) {
            getLogger().i('expansionChanged Started');
            if (state is! _ActionSuccess) return;
            _ActionSuccess currentState = state as _ActionSuccess;

            List<bool>? isExpandedList = currentState.isExpandedList;
            List<GlobalKey<ExpansionTileCustomState>>? itemKeys =
                currentState.itemKeys;
            if (isExpandedList != null && itemKeys != null) {
              emit(currentState.copyWith(
                  isExpandedList: List<bool>.of(isExpandedList)
                    ..removeAt(itemKeys.indexOf(event.expansionKey) + 1)
                    ..insert(itemKeys.indexOf(event.expansionKey) + 1,
                        event.isExpanded)));
            }
          },
          expandedBtnPressed: (_ExpandedBtnPressed event) {
            getLogger().i('expandedBtnPressed Started');
            event.expansionKey.currentState?.toggle();
          },
          touristFormChanged: (_TouristFormChangedEvent event) {
            getLogger().i('touristFormChanged Started');

            _ActionSuccess currentState = state as _ActionSuccess;
            List<TouristModel?> updatedTouristList = [
              ...currentState.touristList
            ];
            updatedTouristList
              ..removeAt(event.index)
              ..insert(event.index, event.touristModel);
            emit(currentState.copyWith(touristList: updatedTouristList));
          },
          payBtnPressed: (_PayBtnPressed event) {
            getLogger().i('payBtnPressed Started');
            _ActionSuccess currentState = state as _ActionSuccess;

            bool allTouristsInfoFormKeysValid =
                _areAllFormsValid(currentState.touristsInfoFormKey);

            if (currentState.touristList.isNotEmpty &&
                currentState.buyerModel != null &&
                currentState.buyerModel!.phoneNumber.isValidPhone() &&
                currentState.buyerModel!.emailAddress.isValidEmail() &&
                (currentState.buyerInfoFormKey.currentState?.validate() ??
                    false) &&
                currentState.touristsInfoFormKey.isNotEmpty &&
                allTouristsInfoFormKeysValid) {
              event.context.router.push(PaidRoute());
            } else {
              event.onError.call();
            }
          },
        );
      },
    );
  }

  ///Rooms Repository instance
  final IReservationRepository _iReservationRepository;

  bool _areAllFormsValid(List<GlobalKey<FormState>> formKeys) {
    for (var formKey in formKeys) {
      var formState = formKey.currentState;

      if (formState == null || !formState.validate()) {
        return false;
      }
    }
    return true;
  }
}
