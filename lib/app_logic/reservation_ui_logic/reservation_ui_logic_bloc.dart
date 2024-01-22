import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/reservation/i_reservation_repository.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
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
                return ReservationUiLogicState.actionSuccess(reservationModel);
              },
            );
            emit(reservationUiLogicState);
          },
        );
      },
    );
  }

  ///Rooms Repository instance
  final IReservationRepository _iReservationRepository;
}
