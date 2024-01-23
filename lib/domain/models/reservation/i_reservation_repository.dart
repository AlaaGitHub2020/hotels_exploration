import 'package:dartz/dartz.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';

///IReservation Repository
abstract class IReservationRepository {
  Future<Either<ModelsFailure, ReservationModel>> fetchReservationData();
}
