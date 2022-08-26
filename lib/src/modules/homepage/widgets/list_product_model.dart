import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/usecases/category_usercase/product_usercase.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListProductModel extends ViewModel{
  final ProductUserCase _productUserCase;
  RxList<Product> dataProduct = RxList.empty();

  RxInt size = 8.obs;
  RxInt totalPage = 0.obs;
  RxInt categoryId = 0.obs;

  ListProductModel(this._productUserCase);


  Future<void> loadProductNew() async{
    loading(() async{
      await _productUserCase.doGetAllProductNew(0,size.value).then((value) async{
        dataProduct.value = value.content ?? [Product()];
        totalPage.value = value.totalElements ?? 0;
      });
    });
  }

}