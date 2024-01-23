import 'package:freezed_annotation/freezed_annotation.dart';

part 'models_failure.freezed.dart';

@freezed
abstract class ModelsFailure with _$ModelsFailure {
  const factory ModelsFailure.unexpected() = _Unexpected;

  const factory ModelsFailure.fetchHotelDataFailure() = _FetchHotelDataFailure;

  const factory ModelsFailure.fetchRoomsListFailure() = _FetchRoomsListFailure;

  const factory ModelsFailure.fetchReservationDataFailure() =
      _FetchReservationDataFailure;
}
