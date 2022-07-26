import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:deskover_develop/src/apis/order/request/order_resquest.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'order_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class OrderAPI{
  @factoryMethod
  factory OrderAPI(Dio dio) = _OrderAPI;


  @POST('/v1/api/customer/order')
  Future<MessageResponse> addOrder(@Body() OrderResquest orderResquest);

}