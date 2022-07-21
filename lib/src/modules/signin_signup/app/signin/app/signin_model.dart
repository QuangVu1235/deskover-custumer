import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/modules/main_page.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninModel extends ViewModel {


  TextEditingController inputPhone = TextEditingController();
  TextEditingController inputPassword = TextEditingController();
  TextEditingController passtxt = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isShowPass = true.obs;
  RxBool checkPass = false.obs;
  RxString titleMessPass = ''.obs;
  RxnString userSeletected = RxnString();

  void onShowPass() {
    isShowPass.value = !isShowPass.value;
  }

  void errorPass(String title, bool check) {
    titleMessPass.value = title;
    checkPass.value = check;
  }

  void onForgetPassword() {
    //Get.to(() => const ForgetPassWordScreen());
  }

  void openMainPage() {
    Get.offAll(() => const MainPage());
  }



  void onLogin() {
    Get.offAll(const MainPage(indexTab: 0,));
    // if (!(formKey.currentState?.validate() ?? false)) {
    //   // not validate or null
    //   return;
    // }
    
    // loading(() async {
    //
    //   Future.wait([
    //     sharedPreferences.setString('uPhone', inputPhone.text),
    //     sharedPreferences.setString('uToken', value.token ?? ''),
    //     sharedPreferences.setString('uId', value.userId?.toString() ?? ''),
    //     sharedPreferences.setString('uType', value.userType ?? ''),
    //     sharedPreferences.setString('password', inputPassword.text),
    //   ]);
    //   getIt<Dio>().options = BaseOptions(headers: {
    //     'Authorization': (value.token?.isNotEmpty ?? false)
    //     ? 'Bearer ${value.token}'
    //     : BaseApi.mutosiStoreToken,
    //   });
    //   await _cartUsecase.getProducts();
    // },reCatchString: true)
    // .then((value) async {
    //   Get.offAll(const MainPage(indexTab: 0,));
    // });
  }

  void onRegistration() {
   // Get.to(BusinessRegistration());
  }
  
}
