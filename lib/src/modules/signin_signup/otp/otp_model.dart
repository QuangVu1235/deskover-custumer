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
class OtpModel extends ViewModel{
    final UserUserCase _userUserCase;
    TextEditingController inputPhone = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    OtpModel(this._userUserCase);

    Future<void> cancelConfirm()async {
        Get.offAll(SigninPage());
    }

    void onCompletedOTP(String otp) async {
        loading(() async {
            return await _userUserCase.confirmOTP(otp, inputPhone.text);
        }).then((value) async {
            Get.offAll(SuccessScreen(
                subtitle: 'Yêu cầu đăng kí tài khoản của bạn',
                pressButton: () => Get.offAll(const SigninPage()),
            ));
            // if (value is SignupResponses) {
            //     await sharedPreferences.setString('uPhone', inputPhone.text);
            //     await sharedPreferences.setString('uToken', value.userToken ?? '');
            //     await sharedPreferences.setString('uId', value.userId?.toString() ?? '');
            //     await sharedPreferences.setString('uType', value.userType ?? '');
            //     await sharedPreferences.setString('password', inputPassword.text);
            //     getIt<Dio>().options = BaseOptions(headers: {
            //         'Authorization': (value.userToken?.isNotEmpty ?? false) ? 'Bearer ${value.userToken}': BaseApi.mutosiStoreToken,
            //     });
            //     Get.offAll(GlobalConfigurationScreen(
            //         textTitle: 'Đăng ký thành công',
            //         textContent: 'Chúc mừng\nbạn đã đăng ký thành công tài khoản',
            //         textButton: 'Về trang chủ',
            //         pressButton: () => Get.offAll(const MainPage(indexTab: 0,)),
            //     ));
            // }
        });
    }

    void reSendOTP() async {
        loading(() async {
            return await _userUserCase.resendOTP(inputPhone.text);
        }).then((value) {
            AppUtils().showPopup(title: 'Thành công', subtitle: 'Mã OTP đã được gửi về\n Sđt: ${inputPhone.text}', isSuccess: true);
        });
    }

    void resetPasswordOTP(String phone) async {
        if (!(formKey.currentState?.validate() ?? false)) {
            // not validate or null
            return;
        }
        loading(() async {
            return await _userUserCase.resendOTP(phone);
        },reCatchString: true).then((value) {
            AppUtils().showPopup(title: 'Thành công', subtitle: 'Mã OTP đã được gửi về\n Sđt: ${inputPhone.text}', isSuccess: true);
            Get.offAll(ResetPassOTP(phone: inputPhone.text,));
        });
    }

    void onCompletedResetPassOTP(String otp) async {
        loading(() async {
            return await _userUserCase.confirmOTP(otp, inputPhone.text);
        },reCatchString: true).then((value) async {
            Get.offAll(ResetPassword(phone: inputPhone.text,));
        });
    }
}