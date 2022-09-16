// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:event_bus/event_bus.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/datasource/api/master_api.dart' as _i8;
import '../core/data/datasource/api/user_api.dart' as _i12;
import '../core/data/repository/master/master_repository.dart' as _i9;
import '../core/data/repository/master/master_repository_impl.dart' as _i10;
import '../core/utils/media_service.dart' as _i5;
import '../core/utils/permission_service.dart' as _i6;
import '../ui/find_service/bloc/personal_information_bloc.dart' as _i11;
import 'app_modules.dart' as _i13;
import 'network_modules.dart' as _i14;

const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.EventBus>(appModule.eventBus);
  gh.singleton<_i4.FlutterSecureStorage>(appModule.storage);
  gh.factory<_i5.MediaService>(() => _i5.MediaServiceImpl());
  gh.factory<_i6.PermissionService>(() => _i6.PermissionServiceHandler());
  await gh.factoryAsync<_i7.Dio>(
    () => networkModule.devDio(get<_i4.FlutterSecureStorage>()),
    registerFor: {_dev},
    preResolve: true,
  );
  gh.factory<_i8.MasterApi>(() => _i8.MasterApi(get<_i7.Dio>()));
  gh.factory<_i9.MasterRepository>(
      () => _i10.MasterRepositoryImpl(get<_i8.MasterApi>()));
  gh.factory<_i11.PersonalInformationBloc>(
      () => _i11.PersonalInformationBloc(get<_i9.MasterRepository>()));
  gh.factory<_i12.UserApi>(() => _i12.UserApi(get<_i7.Dio>()));
  return get;
}

class _$AppModule extends _i13.AppModule {}

class _$NetworkModule extends _i14.NetworkModule {}
