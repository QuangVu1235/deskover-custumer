//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/modules/signin_signup/app/signin/app/signin_screen.dart';
import 'package:deskover_develop/src/usecases/cart_usercase/cart_usercase.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import 'exchange_points/cart_model.dart';

@lazySingleton
class MainPageModel extends ViewModel {
  final CartUserCase _cartUserCase;
  RxInt index = 0.obs;
  RxInt itemCart = 0.obs;
  RxList<Cart> dataCartResponse = RxList.empty();
  RxBool notification = false.obs;

  MainPageModel(this._cartUserCase);


  @override
  void initState() {
    super.initState();

  }

  void openLogin() {
    Get.to(const SigninPage());
  }

  void openFlashSale() {
    //Get.to(const FlashSalePage());
  }

  Future<void> loadCart() async {
    await _cartUserCase.doGetAllCartOrder('minhbd').then((value) async{
      dataCartResponse.value =  value ?? [];
      print('>>>>>>>>>');
      print(dataCartResponse.value.length);
      itemCart.value = dataCartResponse.value.length;

    });
  }

  Future<void> openNotification() async {
    notification.value = false;
   // Get.to(NotificationScreen());
  }

}
