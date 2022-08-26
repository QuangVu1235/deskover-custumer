import 'package:deskover_develop/src/modules/signin_signup/otp/otp_screen.dart';
import 'package:deskover_develop/src/usecases/user_usercase.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpModel extends ViewModel {
  final UserUserCase _userUserCase;

  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final RxString phoneRequest = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpModel(this._userUserCase);

  void onSignUp() {
    if (!(formKey.currentState?.validate() ?? false)) {
      // not validate or null
      return;
    }
    loading(() async{
      await _userUserCase.doPostCreateUser({
        'username' : phone.text,
        'password' : password.text,
        'confirmPassword': confirmPass.text,
        'fullname': fullName.text,
         'email' : email.text
      });
    },reCatchString: true).then((value) => Get.offAll(OTPScreen(phone: phoneRequest.value = phone.text,)));
  }
}
