import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../core/config/config.dart';

@module
abstract class NetworkModule {
  @dev
  @preResolve
  Future<Dio> devDio(FlutterSecureStorage storage) async {
    final dio = Dio(
        BaseOptions(baseUrl: Config.baseUrl, receiveDataWhenStatusError: true));

    // menampilkan log api request
    dio.interceptors
        .add(DioLoggingInterceptor(level: Level.body, compact: false));
    return dio;
  }
}
