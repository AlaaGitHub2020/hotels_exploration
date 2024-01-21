import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/room/i_rooms_repository.dart';
import 'package:hotels_exploration/domain/models/room/rooms_list_model.dart';
import 'package:injectable/injectable.dart';

part 'rooms_ui_logic_event.dart';

part 'rooms_ui_logic_state.dart';

part 'rooms_ui_logic_bloc.freezed.dart';

@injectable
class RoomsUiLogicBloc extends Bloc<RoomsUiLogicEvent, RoomsUiLogicState> {
  RoomsUiLogicBloc(this._iRoomsRepository)
      : super(const RoomsUiLogicState.initial()) {
    on<RoomsUiLogicEvent>(
        (RoomsUiLogicEvent event, Emitter<RoomsUiLogicState> emit) async {
      await event.map(
        getRoomsListData: (_GetRoomsListDataEvent event) async {
          getLogger().i('getRoomsListData Started');
          emit(const RoomsUiLogicState.loading());
          final Either<ModelsFailure, RoomsListModel> failureOrSuccess =
              await _iRoomsRepository.fetchRoomsList();
          RoomsUiLogicState roomsUiLogicState = failureOrSuccess.fold(
            (ModelsFailure failure) {
              return RoomsUiLogicState.actionFailure(failure);
            },
            (RoomsListModel roomsListModel) {
              return RoomsUiLogicState.actionSuccess(
                roomsListModel,
                controller: _controller,
                currentIndex: 0,
              );
            },
          );
          emit(roomsUiLogicState);
        },
        imageSliderChanged: (_ImageSliderChangedEvent event) async {
          getLogger().i('imageSliderChanged Started');
          if (state is! _ActionSuccess) return;
          _ActionSuccess currentState = state as _ActionSuccess;
          emit(currentState.copyWith(currentIndex: event.index));
        },
      );
    });
  }

  ///Rooms Repository instance
  final IRoomsRepository _iRoomsRepository;

  ///Carousel Controller
  static final CarouselController _controller = CarouselController();
}
