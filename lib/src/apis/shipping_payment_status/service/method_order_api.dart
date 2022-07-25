import 'package:deskover_develop/src/apis/shipping_payment_status/response/shipping_payment_status.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'method_order_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class MethodOrderApi{
  @factoryMethod
  factory MethodOrderApi(Dio dio) = _MethodOrderApi;

  @GET('/v1/api/custumer/payment')
  Future<List<Payment>?> doGetAllPayment();

  @GET('/v1/api/custumer/payment/{id}')
  Future<Payment> doGetByIdPayment(@Path('id') int? id);

  @GET('/v1/api/custumer/shipping')
  Future<List<Payment>?> doGetAllShipping();

  @GET('/v1/api/custumer/shipping/{id}')
  Future<Payment> doGetByIdShipping(@Path('id') int? id);




}