part of 'hotels_ui_logic_bloc.dart';

@freezed
class HotelsUiLogicState with _$HotelsUiLogicState {
  const factory HotelsUiLogicState.initial() = _Initial;

  const factory HotelsUiLogicState.loading() = _Loading;

  const factory HotelsUiLogicState.actionFailure(ModelsFailure failure) =
      _ActionFailure;

  const factory HotelsUiLogicState.actionSuccess(
    HotelModel hotelModel, {
    int? currentIndex,
    CarouselController? controller,
  }) = _ActionSuccess;
}
