import 'package:deskover_develop/src/apis/category/response/category_response.dart';
import 'package:deskover_develop/src/apis/product/response/product_response.dart';
import 'package:deskover_develop/src/modules/cart/cart_model.dart';
import 'package:deskover_develop/src/usecases/cart_usercase/cart_usercase.dart';
import 'package:deskover_develop/src/usecases/category_usercase/category_usercase.dart';
import 'package:deskover_develop/src/usecases/category_usercase/product_usercase.dart';
import 'package:deskover_develop/src/utils/AppUtils.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageModel extends ViewModel{
  final CategoryUserCase _categoryUserCase;
  final ProductUserCase _productUserCase;
  final CartUserCase _cartUserCase;

  RxList<CategoryReponse> DataCategory = RxList.empty();
  RxList<Product> dataProductNew = RxList.empty();
  RxInt size = 8.obs;

  HomePageModel(this._categoryUserCase, this._productUserCase, this._cartUserCase);

  @override
  void initState() {
    super.initState();
   loadCategory();
   loadProductNew();
  }


  Future<void> loadCategory() async{
    loading(() async{
     await _categoryUserCase.doGetAll().then((value) async{
        DataCategory.value = value ?? [];
      }).catchError((error) async{
       DataCategory.value = [];
        AppUtils().showPopup(
            isSuccess: false,
            subtitle: error.replace('Connecting timed out', 'Kết nối quá hạng')
        );
      });
    }).then((value) async{

    }).catchError((error) async{

    });
  }
  Future<void> loadProductNew() async{
     loading(() async{
     await _productUserCase.doGetAllProductNew(0,size.value).then((value) async{
        dataProductNew.value = value.content ?? [Product()];
      });
    });
  }

}