part of 'rooms_ui_logic_bloc.dart';

@freezed
class RoomsUiLogicState with _$RoomsUiLogicState {
  const factory RoomsUiLogicState.initial() = _Initial;

  const factory RoomsUiLogicState.loading() = _Loading;

  const factory RoomsUiLogicState.actionFailure(ModelsFailure failure) =
      _ActionFailure;

  const factory RoomsUiLogicState.actionSuccess(
    RoomsListModel roomsListModel, {
    int? currentIndex,
    CarouselController? controller,
  }) = _ActionSuccess;
}
