part of 'reservation_ui_logic_bloc.dart';

@freezed
class ReservationUiLogicEvent with _$ReservationUiLogicEvent {
  const factory ReservationUiLogicEvent.getReservationData() =
      _GetReservationDataEvent;
}
