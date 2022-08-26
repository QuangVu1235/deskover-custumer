import 'package:deskover_develop/src/modules/signin_signup/app/signin/app/signin_screen.dart';
import 'package:deskover_develop/src/modules/signin_signup/location/app/success_screen.dart';
import 'package:deskover_develop/src/modules/signin_signup/reset_pass/app/reset_pass_otp.dart';
import 'package:deskover_develop/src/modules/signin_signup/reset_pass/app/reset_password.dart';
import 'package:deskover_develop/src/usecases/user_usercase.dart';
import 'package:deskover_develop/src/utils/AppUtils.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPassModel extends ViewModel{
    final UserUserCase _userUserCase;
    TextEditingController inputPhone = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController newPassword = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    ResetPassModel(this._userUserCase);

    Future<void> cancelConfirm()async {
        Get.offAll(SigninPage());
    }

    void confirmNewPassword() async{
        if (!(formKey.currentState?.validate() ?? false)) {
            // not validate or null
            return;
        }
        loading(() async {
            return await _userUserCase.confirmPassReset(inputPhone.text, password.text,newPassword.text );
        },reCatchString: true).then((value) async {
            Get.offAll(SuccessScreen(subtitle: 'Lấy lại mật khẩu',
                pressButton: () => Get.offAll(const SigninPage()),
            ));
        });
    }

}