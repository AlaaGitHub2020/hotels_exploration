import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_model.freezed.dart';

part 'reservation_model.g.dart';

@freezed
class ReservationModel with _$ReservationModel {
  @JsonSerializable(explicitToJson: true)
  factory ReservationModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'hotel_name') String? hotelName,
    @JsonKey(name: 'hotel_adress') String? hotelAddress,
    @JsonKey(name: 'horating') int? hotelRating,
    @JsonKey(name: 'rating_name') String? ratingName,
    @JsonKey(name: 'departure') String? departure,
    @JsonKey(name: 'arrival_country') String? arrivalCountry,
    @JsonKey(name: 'tour_date_start') String? tourDateStart,
    @JsonKey(name: 'tour_date_stop') String? tourDateStop,
    @JsonKey(name: 'number_of_nights') int? numberOfNights,
    @JsonKey(name: 'room') String? room,
    @JsonKey(name: 'nutrition') String? nutrition,
    @JsonKey(name: 'tour_price') int? tourPrice,
    @JsonKey(name: 'fuel_charge') int? fuelCharge,
    @JsonKey(name: 'service_charge') int? serviceCharge,
  }) = _ReservationModel;

  ReservationModel._();

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  static ReservationModel get empty => ReservationModel(
        id: 0,
        hotelName: '',
        hotelAddress: '',
        hotelRating: 0,
        ratingName: '',
        departure: '',
        arrivalCountry: '',
        tourDateStart: '',
        tourDateStop: '',
        numberOfNights: 0,
        room: '',
        nutrition: '',
        tourPrice: 0,
        fuelCharge: 0,
        serviceCharge: 0,
      );
}
