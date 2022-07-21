import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/apis/product/service/product_api.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDataSource{
  Future<DataProductResponse> doGetProductNew(int page,int size);

}
@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl extends ProductDataSource{
  final ProductAPI _productAPI;

  ProductDataSourceImpl(this._productAPI);

  @override
  Future<DataProductResponse> doGetProductNew(int page,int size)
  => _productAPI.goGetAll(page,size);

}