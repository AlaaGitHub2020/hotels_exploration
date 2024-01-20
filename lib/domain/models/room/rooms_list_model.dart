import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hotels_exploration/domain/models/room/room_model.dart';

part 'rooms_list_model.freezed.dart';

part 'rooms_list_model.g.dart';

@freezed
class RoomsListModel with _$RoomsListModel {
  @JsonSerializable(explicitToJson: true)
  factory RoomsListModel({
    @JsonKey(name: 'rooms') List<RoomModel?>? roomsList,
  }) = _RoomsListModel;

  RoomsListModel._();

  factory RoomsListModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsListModelFromJson(json);

  static RoomsListModel get empty => RoomsListModel(
        roomsList: [],
      );
}
