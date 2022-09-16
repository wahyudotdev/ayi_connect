import 'package:ayi_connect/core/data/model/province.dart';
import 'package:ayi_connect/core/utils/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MasterRepository {
  Future<Either<Failure, List<Province>>> getProvinces();
}
