import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_input_form_widget.dart';
import 'package:deskover_develop/src/modules/signin_signup/otp/otp_model.dart';
import 'package:deskover_develop/src/modules/signin_signup/reset_pass/app/reset_pass_otp.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/assets/image_asset.dart';
import '../../../../themes/space_values.dart';
import '../../../../themes/ui_colors.dart';

class InputPhoneNumberScreen extends StatefulWidget {

  const InputPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<InputPhoneNumberScreen> createState() => _InputPhoneNumberScreenState();
}

class _InputPhoneNumberScreenState extends ViewWidget<InputPhoneNumberScreen, OtpModel> {
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
            child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height *0.55,
                   padding: const EdgeInsets.only(top: 50),
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child:  Image.asset(ImageAssets.signup_img,height: 290,),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: UIColors.black,
                    ),
                  ),
                  SizedBox(
                    height: SpaceValues.space24,
                  ),
                  Form(
                    key: viewModel.formKey,
                      child:  GlobalInputFormWidget(
                        controller: viewModel.inputPhone,
                        textInputType:TextInputType.phone,
                        validator:(valueDy)=> Validator.phone(valueDy),
                        requireInput: '',
                        hint: 'Số điện thoại',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: SvgPicture.asset(SvgImageAssets.iconphone,height: 15,),
                        ),
                      ),),
                  const SizedBox(height: SpaceValues.space12,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          viewModel.resetPasswordOTP(viewModel.inputPhone.text);
                          // Get.to(ResetPassOTP());
                        },
                        child:const Padding(
                          padding:  EdgeInsets.only(top: SpaceValues.space8,bottom: SpaceValues.space8 ),
                          child: Text("Tiếp Tục"),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){
                          Get.back();
                        } ,
                        child:const Padding(
                          padding:  EdgeInsets.only(top: SpaceValues.space8,bottom: SpaceValues.space8 ),
                          child: Text("Trở về",style: TextStyle(fontSize: 13,color: Colors.grey),),
                        ),

                      ),
                    ],
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
