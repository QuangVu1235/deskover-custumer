import 'package:deskover_develop/src/apis/product/product_datasoure.dart';
import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProductUserCase{
  final ProductDataSource _productDataSource;

  @factoryMethod
  ProductUserCase(this._productDataSource);

  Future<DataProductResponse> doGetAllProductNew(int page,int size)
  => _productDataSource.doGetProductNew(page,size);
}