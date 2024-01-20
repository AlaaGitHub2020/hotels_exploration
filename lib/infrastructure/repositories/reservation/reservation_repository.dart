import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotels_exploration/domain/api/api_failure.dart';
import 'package:hotels_exploration/domain/api/i_api_repository.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/reservation/i_reservation_repository.dart';
import 'package:hotels_exploration/domain/models/reservation/reservation_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IReservationRepository)
class ReservationRepository implements IReservationRepository {
  final IAPIRepository _apiRepository;

  ReservationRepository(this._apiRepository);

  @override
  Future<Either<ModelsFailure, ReservationModel>> fetchReservationData() async {
    try {
      getLogger().i('fetchReservationData Started');
      Either<APIFailure, Response<dynamic>> getDataResponse =
          await _apiRepository
              .getData(InfrastructureConstants.screen3UrlFetchReservationData);
      late ReservationModel? reservationModel;
      getDataResponse.fold((failure) {
        getLogger().e('Failure : $failure');
      }, (response) {
        var decodedResponse = json.decode(response.data);
        reservationModel = ReservationModel.fromJson(decodedResponse);
      });
      if (reservationModel == null) {
        return left(const ModelsFailure.fetchReservationFailureDataFailure());
      } else {
        return right(reservationModel!);
      }
    } on Exception catch (error) {
      getLogger().e('Exception Error: $error');
      return left(const ModelsFailure.fetchReservationFailureDataFailure());
    }
  }
}
