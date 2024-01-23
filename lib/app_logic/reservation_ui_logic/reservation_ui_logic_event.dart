part of 'reservation_ui_logic_bloc.dart';

@freezed
class ReservationUiLogicEvent with _$ReservationUiLogicEvent {
  const factory ReservationUiLogicEvent.getReservationData() =
      _GetReservationDataEvent;

  const factory ReservationUiLogicEvent.buyerInformationFormChanged(
      BuyerModel buyerModel) = _BuyerInformationFormChangedEvent;

  const factory ReservationUiLogicEvent.touristFormChanged(
      TouristModel touristModel, int index) = _TouristFormChangedEvent;

  const factory ReservationUiLogicEvent.addNewTouristPressed() =
      _AddNewTouristPressedEvent;

  const factory ReservationUiLogicEvent.expansionChanged(
          GlobalKey<ExpansionTileCustomState> expansionKey, bool isExpanded) =
      _ExpansionChangedEvent;

  const factory ReservationUiLogicEvent.expandedBtnPressed(
      GlobalKey<ExpansionTileCustomState> expansionKey) = _ExpandedBtnPressed;
}
