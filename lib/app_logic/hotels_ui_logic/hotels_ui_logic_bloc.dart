import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/domain/models/hotel/i_hotel_repository.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:injectable/injectable.dart';

part 'hotels_ui_logic_event.dart';

part 'hotels_ui_logic_state.dart';

part 'hotels_ui_logic_bloc.freezed.dart';

@injectable
class HotelsUiLogicBloc extends Bloc<HotelsUiLogicEvent, HotelsUiLogicState> {
  HotelsUiLogicBloc(this._iHotelRepository)
      : super(const HotelsUiLogicState.initial()) {
    on<HotelsUiLogicEvent>(
        (HotelsUiLogicEvent event, Emitter<HotelsUiLogicState> emit) async {
      await event.map(
        getHotelData: (_GetHotelDataEvent event) async {
          getLogger().i('getHotelData Started');
          emit(const HotelsUiLogicState.loading());
          final Either<ModelsFailure, HotelModel> failureOrSuccess =
              await _iHotelRepository.fetchHotelData();
          HotelsUiLogicState hotelsUiLogicState = failureOrSuccess.fold(
            (ModelsFailure failure) {
              return HotelsUiLogicState.actionFailure(failure);
            },
            (HotelModel success) {
              return HotelsUiLogicState.actionSuccess(
                success,
                controller: _controller,
                currentIndex: 0,
              );
            },
          );
          emit(hotelsUiLogicState);
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

  ///Hotel Repository instance
  final IHotelRepository _iHotelRepository;

  ///Carousel Controller
  static final CarouselController _controller = CarouselController();
}
