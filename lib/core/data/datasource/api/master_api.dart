import 'package:ayi_connect/core/data/model/api_response.dart';
import 'package:ayi_connect/core/data/model/province.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part '../../../../gen/core/data/datasource/api/master_api.g.dart';

@RestApi()
@Injectable()
abstract class MasterApi {
  @factoryMethod
  factory MasterApi(Dio dio) = _MasterApi;

  @GET('/provice.json')
  Future<ApiResponse<List<Province>>> getProvince();
}
