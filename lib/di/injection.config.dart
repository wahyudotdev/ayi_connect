// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:event_bus/event_bus.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/datasource/api/master_api.dart' as _i9;
import '../core/data/datasource/api/user_api.dart' as _i13;
import '../core/data/repository/master/master_repository.dart' as _i10;
import '../core/data/repository/master/master_repository_impl.dart' as _i11;
import '../core/utils/media_service.dart' as _i5;
import '../core/utils/permission_service.dart' as _i6;
import '../ui/find_service/bloc/personal_information_bloc.dart' as _i12;
import '../ui/find_service/bloc/profesional_information_bloc.dart' as _i7;
import 'app_modules.dart' as _i14;
import 'network_modules.dart' as _i15;

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
  gh.factory<_i7.ProfesionalInformationBloc>(
      () => _i7.ProfesionalInformationBloc());
  await gh.factoryAsync<_i8.Dio>(
    () => networkModule.devDio(get<_i4.FlutterSecureStorage>()),
    registerFor: {_dev},
    preResolve: true,
  );
  gh.factory<_i9.MasterApi>(() => _i9.MasterApi(get<_i8.Dio>()));
  gh.factory<_i10.MasterRepository>(
      () => _i11.MasterRepositoryImpl(get<_i9.MasterApi>()));
  gh.factory<_i12.PersonalInformationBloc>(
      () => _i12.PersonalInformationBloc(get<_i10.MasterRepository>()));
  gh.factory<_i13.UserApi>(() => _i13.UserApi(get<_i8.Dio>()));
  return get;
}

class _$AppModule extends _i14.AppModule {}

class _$NetworkModule extends _i15.NetworkModule {}
