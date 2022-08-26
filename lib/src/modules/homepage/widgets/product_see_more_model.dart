import 'package:deskover_develop/src/apis/category/response/category_response.dart';
import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/modules/cart/cart_model.dart';
import 'package:deskover_develop/src/modules/homepage/homepage_screen.dart';
import 'package:deskover_develop/src/modules/main_page.dart';
import 'package:deskover_develop/src/usecases/cart_usercase/cart_usercase.dart';
import 'package:deskover_develop/src/usecases/category_usercase/category_usercase.dart';
import 'package:deskover_develop/src/usecases/category_usercase/product_usercase.dart';
import 'package:deskover_develop/src/utils/AppUtils.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductSeeMoreModel extends ViewModel{
  final ProductUserCase _productUserCase;
  RxList<Product> dataProductDiscount = RxList.empty();

  RxInt size = 8.obs;
  RxString keySort = 'DESC'.obs;

  RxBool flashSale = true.obs;

  ProductSeeMoreModel(this._productUserCase);

  @override
  void initState() {
    refresh();
  }

  Future<void> refresh()async {
    await Future.wait([
      loadProductDiscount()
    ]);
  }

  Future<void> loadProductDiscount() async{
    loading(() async{
      await _productUserCase.doGetProductByDiscount(0,size.value,keySort.value).then((value) async{
        dataProductDiscount.value = value.content ?? [Product()];
      });
    });
  }

}