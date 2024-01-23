import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hotels_exploration/domain/api/api_failure.dart';
import 'package:hotels_exploration/domain/api/i_api_repository.dart';
import 'package:hotels_exploration/domain/core/utilities/config.dart';
import 'package:hotels_exploration/domain/core/utilities/constants.dart';
import 'package:hotels_exploration/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@LazySingleton(as: IAPIRepository)
class APIRepository implements IAPIRepository {
  /// Factory constructor
  factory APIRepository() => _instance;

  APIRepository._internal();

  static final APIRepository _instance = APIRepository._internal();

  /// Dio client
  late final Dio _dio;

  ///Dio BaseOptions
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Config().get(InfrastructureConstants.apiBaseUrlKey),
    contentType: ContentType.json.toString(),
    responseType: ResponseType.plain,
    connectTimeout: const Duration(milliseconds: 10000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );

  @override
  Future<Either<APIFailure, Unit>> init() async {
    try {
      getLogger().i('init Started');
      _dio = Dio(_baseOptions);
      if (kDebugMode) {
        _dio.interceptors.add(PrettyDioLogger());
      }
      return right(unit);
    } on Exception catch (error) {
      getLogger().e('Error:$error');
      return left(const APIFailure.intiFailure());
    }
  }

  @override
  Future<Either<APIFailure, Response>> getData(String endpoint,
      {Options? options}) async {
    try {
      getLogger().i('getData Started');
      Response getDataResponse = await _dio.get(
        endpoint,
        options: options,
      );
      return right(getDataResponse);
    } on Exception catch (error) {
      getLogger().e('Error:$error');
      return left(const APIFailure.failedToFetchData());
    }
  }
}
