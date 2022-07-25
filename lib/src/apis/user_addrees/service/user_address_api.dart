import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:deskover_develop/src/apis/user_addrees/response/user_address.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'user_address_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class UserAddressApi{
  @factoryMethod
  factory UserAddressApi(Dio dio) = _UserAddressApi;

  @GET('/v1/api/custumer/user/address')
  Future<List<UserAddress>?> doGetAddress(@Query('username') String? username);

  @POST('/v1/api/custumer/user/address')
  Future<MessageResponse> doPostAddress(@Body() UserAddress userAddress,@Query('username') String? username);

  @PUT('/v1/api/custumer/user/address/{id}')
  Future<List<UserAddress>?> changeActive(@Path('id') int? id,@Query('username') String? username);

  @PUT('/v1/api/custumer/user/address-choose/{id}')
  Future<MessageResponse> changeChoose(@Path('id') int? id,@Query('username') String? username);
}