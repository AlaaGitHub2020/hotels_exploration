part of 'reservation_ui_logic_bloc.dart';

@freezed
class ReservationUiLogicState with _$ReservationUiLogicState {
  const factory ReservationUiLogicState.initial() = _Initial;

  const factory ReservationUiLogicState.loading() = _Loading;

  const factory ReservationUiLogicState.actionFailure(ModelsFailure failure) =
      _ActionFailure;

  const factory ReservationUiLogicState.actionSuccess(
      ReservationModel reservationModel) = _ActionSuccess;
}
