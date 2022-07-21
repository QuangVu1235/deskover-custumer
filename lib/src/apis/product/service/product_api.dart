import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'product_api.g.dart';

@RestApi(baseUrl: BaseApi.baseUrl)
@LazySingleton()
abstract class ProductAPI{
  @factoryMethod
  factory ProductAPI(Dio dio) = _ProductAPI;

  @GET('/v1/api/custumer/display-product-new')
  Future<DataProductResponse> goGetAll(@Query('page') int? page, @Query('size') int? size);
}