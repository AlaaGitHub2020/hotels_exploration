import 'package:dartz/dartz.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';

///IHotel Repository
abstract class IHotelRepository {
  Future<Either<ModelsFailure, HotelModel>> fetchHotelData();
}
