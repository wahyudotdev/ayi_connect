import 'package:ayi_connect/core/data/datasource/api/master_api.dart';
import 'package:ayi_connect/core/data/model/province.dart';
import 'package:ayi_connect/core/data/repository/master/master_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ayi_connect/core/utils/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MasterRepository)
class MasterRepositoryImpl implements MasterRepository {
  final MasterApi _api;

  MasterRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<Province>>> getProvinces() async {
    try {
      final response = await _api.getProvince();
      return right(response.data);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
