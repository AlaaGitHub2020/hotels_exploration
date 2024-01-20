import 'package:dartz/dartz.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/room/rooms_list_model.dart';

///IRooms Repository
abstract class IRoomsRepository {
  Future<Either<ModelsFailure, RoomsListModel>> fetchRoomsList();
}
