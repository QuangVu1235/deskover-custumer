import 'package:deskover_develop/src/apis/user/response/user_response.dart';
import 'package:deskover_develop/src/modules/cart/cart_model.dart';
import 'package:deskover_develop/src/usecases/user_usercase.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileModel extends ViewModel{
  final SharedPreferences _sharedPreferences;
  final UserUserCase _userUserCase;
  final CartModel _cartModel;
  RxBool isLogin = false.obs;

  ProfileModel(this._sharedPreferences, this._cartModel, this._userUserCase);
  Rxn<User> myProfile = Rxn();

  @override
  initState() {
    loading(() async {
      await Future.wait([
        checkLogin(),
      ]);

    });
  }

  Future<void> checkLogin() async {
    if ((_sharedPreferences.getString("uToken") ?? '').isNotEmpty) {
      if (kDebugMode) {
        print(_sharedPreferences.getString("uToken"));
      }
      await _userUserCase.doGetProfiled().then((value) {
        myProfile.value = value;
      });
      isLogin.value = true;
      // await getProfile();
    } else {
      isLogin.value = false;
    }
  }


}