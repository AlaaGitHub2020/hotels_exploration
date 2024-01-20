import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotels_exploration/domain/api/api_failure.dart';
import 'package:hotels_exploration/domain/api/i_api_repository.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/hotel/hotel_model.dart';
import 'package:hotels_exploration/domain/models/hotel/i_hotel_repository.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IHotelRepository)
class HotelRepository implements IHotelRepository {
  final IAPIRepository _apiRepository;

  HotelRepository(this._apiRepository);

  @override
  Future<Either<ModelsFailure, HotelModel>> fetchHotelData() async {
    try {
      getLogger().i('fetchHotelData Started');
      Either<APIFailure, Response<dynamic>> getDataResponse =
          await _apiRepository
              .getData(InfrastructureConstants.screen1UrlFetchHotelData);
      late HotelModel? hotelModel;
      getDataResponse.fold((failure) {
        getLogger().e('Failure : $failure');
      }, (response) {
        var decodedResponse = json.decode(response.data);
        hotelModel = HotelModel.fromJson(decodedResponse);
      });
      if (hotelModel == null) {
        return left(const ModelsFailure.fetchHotelDataFailure());
      } else {
        return right(hotelModel!);
      }
    } on Exception catch (error) {
      getLogger().e('Exception Error: $error');
      return left(const ModelsFailure.fetchHotelDataFailure());
    }
  }
}
