import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hotels_exploration/domain/api/api_failure.dart';
import 'package:hotels_exploration/domain/api/i_api_repository.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hotels_exploration/domain/models/models_failure.dart';
import 'package:hotels_exploration/domain/models/room/i_rooms_repository.dart';
import 'package:hotels_exploration/domain/models/room/rooms_list_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IRoomsRepository)
class RoomsRepository implements IRoomsRepository {
  final IAPIRepository _apiRepository;

  RoomsRepository(this._apiRepository);

  @override
  Future<Either<ModelsFailure, RoomsListModel>> fetchRoomsList() async {
    try {
      getLogger().i('fetchRoomsList Started');
      Either<APIFailure, Response<dynamic>> getDataResponse =
          await _apiRepository
              .getData(InfrastructureConstants.screen2UrlFetchRoomsList);
      late RoomsListModel? roomsList;
      getDataResponse.fold((failure) {
        getLogger().e('Failure : $failure');
      }, (response) {
        var decodedResponse = json.decode(response.data);
        roomsList = RoomsListModel.fromJson(decodedResponse);
      });
      if (roomsList == null) {
        return left(const ModelsFailure.fetchRoomsListFailure());
      } else {
        return right(roomsList!);
      }
    } on Exception catch (error) {
      getLogger().e('Exception Error: $error');
      return left(const ModelsFailure.fetchRoomsListFailure());
    }
  }
}
