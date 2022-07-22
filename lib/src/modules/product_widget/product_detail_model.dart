import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/usecases/category_usercase/product_usercase.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailModel extends ViewModel{
  final ProductUserCase _productUserCase;

  Rxn<Product> productDetail = Rxn<Product>();
  RxInt indexSlider = 0.obs;
  int idProduct = 0;

  ProductDetailModel(this._productUserCase);

  Future<void> initStateAsync() async {
    await refresh();
  }

  Future<void> refresh() async {
    await Future.wait([
      getProductById(),
    ]);
  }
  Future<void> getProductById()async {
    _productUserCase.getById(idProduct).then((value) async{
      productDetail.value = value;
    });
  }



}