part of 'hotels_ui_logic_bloc.dart';

@freezed
class HotelsUiLogicEvent with _$HotelsUiLogicEvent {
  const factory HotelsUiLogicEvent.getHotelData() = _GetHotelDataEvent;

  const factory HotelsUiLogicEvent.imageSliderChanged(int index) =
      _ImageSliderChangedEvent;
}
