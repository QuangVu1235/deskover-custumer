import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/apis/product/service/product_api.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDataSource{
  Future<DataProductResponse> doGetProductNew(int page,int size);
  Future<DataProductResponse> doGetProductSale(int page,int size);
  Future<DataProductResponse> doGetProductByCategoryId(int categoryId,int page,int size);
  Future<DataProductResponse> doGetProductBySubId(int subId,int page,int size);
  Future<Product> getById(int id);
  Future<DataProductResponse> getSearch(String search, int page, int size);
}
@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl extends ProductDataSource{
  final ProductAPI _productAPI;

  ProductDataSourceImpl(this._productAPI);

  @override
  Future<DataProductResponse> doGetProductNew(int page,int size)
  => _productAPI.goGetAll(page,size);

  @override
  Future<DataProductResponse> doGetProductByCategoryId(int categoryId, int page, int size)
  => _productAPI.doGetProductByCategoryId(categoryId, page, size);

  @override
  Future<DataProductResponse> doGetProductBySubId(int subId, int page, int size)
  => _productAPI.doGetProductBySubId(subId, page, size);

  @override
  Future<Product> getById(int id)
  => _productAPI.getById(id);

  @override
  Future<DataProductResponse> doGetProductSale(int page, int size)
  =>_productAPI.goGetProductSale(page,size);

  @override
  Future<DataProductResponse> getSearch(String search, int page, int size)
  => _productAPI.getSearch(search, page, size);

}