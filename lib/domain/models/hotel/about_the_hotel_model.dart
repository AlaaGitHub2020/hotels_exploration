import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_the_hotel_model.freezed.dart';

part 'about_the_hotel_model.g.dart';

@freezed
class AboutTheHotelModel with _$AboutTheHotelModel {
  @JsonSerializable(explicitToJson: true)
  factory AboutTheHotelModel({
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'peculiarities') List<String?>? peculiarities,
  }) = _AboutTheHotelModel;

  AboutTheHotelModel._();

  factory AboutTheHotelModel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelModelFromJson(json);

  static AboutTheHotelModel get empty => AboutTheHotelModel(
        description: '',
        peculiarities: [],
      );
}
