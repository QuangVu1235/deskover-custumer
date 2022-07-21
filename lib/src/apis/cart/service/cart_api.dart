import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'cart_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class CartAPI{
  @factoryMethod
  factory CartAPI(Dio dio) = _CartAPI;

  @GET('/v1/api/custumer/cart')
  Future<List<Cart>?> doGetAllCartOrder(@Query('username') String? username);

  @POST('/v1/api/custumer/add-cart')
  Future<MessageResponse> addToCart(@Query('username') String? username,@Query('productId') int? productId, @Query('quantity') int? quantity);

  @POST('/v1/api/custumer/minus-cart')
  Future<MessageResponse> minusCart(@Query('username') String? username,@Query('productId') int? productId);

  @DELETE('/v1/api/custumer/cart')
  Future<MessageResponse> deleteCart(@Query('username') String? username,@Query('productId') int? productId);
}