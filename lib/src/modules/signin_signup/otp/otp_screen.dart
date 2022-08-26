import 'dart:async';

import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/signin_signup/location/app/location_screen.dart';
import 'package:deskover_develop/src/modules/signin_signup/otp/otp_model.dart';
import 'package:deskover_develop/src/utils/AppUtils.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../config/assets/image_asset.dart';
import '../../../themes/space_values.dart';
import '../../../themes/ui_colors.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  const OTPScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends ViewWidget<OTPScreen, OtpModel> {
  dynamic number;
  decreaseNumber()async {
    number=60;
    for(int i=60;i>0;i--) {
      print(number);
      await  Future.delayed(const Duration(milliseconds: 1000), () {
        if (number > 0) {
          setState(() {
            number =i-1;
          });
        }
      });
    }
  }
  resetNumber(){
    number=60  ;
  }
  @override
  void initState() {
    super.initState();
    viewModel.inputPhone.text = widget.phone;
    decreaseNumber();
  }

  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: UIColors.login,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.all(50),
                child: Center(
                  child: Image.asset(
                    ImageAssets.otpimg,
                    height: 290,
                  ),
                ),
              ),
              SizedBox(
                height: SpaceValues.space12,
              ),
              Text(
                "Nhập mật khẩu OTP",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: UIColors.black,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nhập mật khẩu OTP gửi đến"),
                  SizedBox(width: 3),
                  Text(
                    widget.phone,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: SpaceValues.space24,
              ),
              Padding(
                padding: const EdgeInsets.all(SpaceValues.space16),
                child: PinCodeTextField(
                  autoFocus: true,
                  enablePinAutofill: true,
                  controller: _textEditingController,
                  appContext: context,
                  length: 6,
                  onCompleted: viewModel.onCompletedOTP,
                  onChanged: (String value) {},
                  animationType: AnimationType.scale,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedColor: UIColors.black30,
                    inactiveColor: Colors.grey,
                    activeColor: UIColors.black30,
                    borderRadius: BorderRadius.circular(SpaceValues.space8),
                    borderWidth: 1,
                    fieldHeight: 58,
                    fieldWidth: 45,
                  ),
                ),
              ),
              number>0? Row(mainAxisSize: MainAxisSize.min, children: [
                const Text('Gửi lại mã sau:'),
                Text(
                  ' ${number}s',
                  style: TextStyle(color: UIColors.brandA),
                ),
              ]):SizedBox(),
              Row(mainAxisSize: MainAxisSize.min, children: [
                const Text('Không nhận được mã OTP?'),
                TextButton(
                    onPressed:() {
                      if(number==0){
                        viewModel.reSendOTP();
                        decreaseNumber();
                      }
                    }, child: const Text('Gửi lại',style: TextStyle(color: UIColors.brandA),)),
              ]),

              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    AppUtils().showPopupConfirm(
                        isSuccess: false,
                        title: 'Exit',
                        subtitle: 'Trở về trang đăng nhập huỷ bỏ đăng kí',
                        action: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: UIColors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: UIColors.black40))),
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text(
                                'Huỷ',
                                style: TextStyle(
                                    color: UIColors.black,
                                    fontWeight: FontWeight.w400),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                viewModel.cancelConfirm();
                              },
                              child: const Text(
                                'Đồng ý',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              )),
                        ]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                        top: SpaceValues.space8, bottom: SpaceValues.space8),
                    child: Text(
                      "Trở về",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  @override
  OtpModel createViewModel() => getIt<OtpModel>();
}
