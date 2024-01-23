import 'package:freezed_annotation/freezed_annotation.dart';

import 'about_the_hotel_model.dart';

part 'hotel_model.freezed.dart';

part 'hotel_model.g.dart';

@freezed
class HotelModel with _$HotelModel {
  @JsonSerializable(explicitToJson: true)
  factory HotelModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'adress') String? address,
    @JsonKey(name: 'minimal_price') int? minimalPrice,
    @JsonKey(name: 'price_for_it') String? priceForIt,
    @JsonKey(name: 'rating') int? rating,
    @JsonKey(name: 'rating_name') String? ratingName,
    @JsonKey(name: 'image_urls') List<String?>? imageUrls,
    @JsonKey(name: 'about_the_hotel') AboutTheHotelModel? aboutTheHotel,
  }) = _HotelModel;

  HotelModel._();

  factory HotelModel.fromJson(Map<String, dynamic> json) =>
      _$HotelModelFromJson(json);

  static HotelModel get empty => HotelModel(
        id: 0,
        name: '',
        address: '',
        minimalPrice: 0,
        priceForIt: '',
        rating: 0,
        ratingName: '',
        imageUrls: [],
        aboutTheHotel: AboutTheHotelModel.empty,
      );
}
