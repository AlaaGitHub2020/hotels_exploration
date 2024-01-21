part of 'rooms_ui_logic_bloc.dart';

@freezed
class RoomsUiLogicEvent with _$RoomsUiLogicEvent {
  const factory RoomsUiLogicEvent.getRoomsListData() = _GetRoomsListDataEvent;

  const factory RoomsUiLogicEvent.imageSliderChanged(int index) =
      _ImageSliderChangedEvent;
}
