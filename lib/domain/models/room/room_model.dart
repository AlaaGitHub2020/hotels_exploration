import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_model.freezed.dart';

part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  @JsonSerializable(explicitToJson: true)
  factory RoomModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'price') int? price,
    @JsonKey(name: 'price_per') String? pricePer,
    @JsonKey(name: 'peculiarities') List<String?>? peculiarities,
    @JsonKey(name: 'image_urls') List<String?>? imageUrls,
  }) = _RoomModel;

  RoomModel._();

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  static RoomModel get empty => RoomModel(
        id: 0,
        name: '',
        price: 0,
        pricePer: '',
        peculiarities: [],
        imageUrls: [],
      );
}
