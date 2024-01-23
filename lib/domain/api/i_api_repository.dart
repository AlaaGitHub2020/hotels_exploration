import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotels_exploration/domain/api/api_failure.dart';

///IAPIRepository:
/// A contract for interacting with an API.
abstract class IAPIRepository {
  ///Initiate the api Configuration.
  Future<Either<APIFailure, Unit>> init();

  /// Fetches data from the specified API endpoint.
  Future<Either<APIFailure, Response>> getData(String endpoint,
      {Options? options});
}
