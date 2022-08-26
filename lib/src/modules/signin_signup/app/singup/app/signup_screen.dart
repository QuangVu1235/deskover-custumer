import 'package:deskover_develop/src/config/assets/image_asset.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_input_form_widget.dart';
import 'package:deskover_develop/src/modules/signin_signup/app/singup/app/siginup_model.dart';
import 'package:deskover_develop/src/modules/signin_signup/otp/otp_screen.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../themes/space_values.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ViewWidget<SignUpScreen, SignUpModel> {
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
                    height: MediaQuery.of(context).size.height *0.2,
                    margin: EdgeInsets.only(top: 50,left: 50,right: 50,bottom: 10),
                    child: Center(
                      child:  Image.asset(ImageAssets.signup_img),
                    ),
                  ),
                  SizedBox(
                    height: SpaceValues.space12,
                  ),
                  Text(
                    "Đăng ký tài khoản",
                    style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: UIColors.black,
                      ),
                    ),
                  SizedBox(
                    height: SpaceValues.space24,
                  ),
                  Form(
                    key: viewModel.formKey,
                      child: Column(
                        children: [
                          GlobalInputFormWidget(
                            controller: viewModel.phone,
                            textInputType:TextInputType.text,
                            validator:(valueDy)=> Validator.phone(valueDy),
                            requireInput: '',
                            hint: 'Số điện thoại',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: SvgPicture.asset(SvgImageAssets.iconphone,height: 15,),
                            ),
                          ),
                          SizedBox(
                            height: SpaceValues.space12,
                          ),
                          GlobalInputFormWidget(
                            controller: viewModel.fullName,
                            textInputType: TextInputType.name,
                            requireInput: '',
                            validator: (valueDy)=> Validator.fullname(valueDy),
                            hint: 'Họ và tên',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset('resources/images/user.png',height: 15,),
                            ),
                          ),
                          SizedBox(
                            height: SpaceValues.space12,
                          ),
                          GlobalInputFormWidget(
                            controller: viewModel.email,
                            validator:(valueDy)=> Validator.email(valueDy),
                            textInputType: TextInputType.emailAddress,
                            requireInput: '',
                            hint: 'Email',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset('resources/images/email.png',height: 15,),
                            ),
                          ),
                          SizedBox(
                            height: SpaceValues.space12,
                          ),
                          GlobalInputFormWidget(
                            controller: viewModel.password,
                            validator: Validator.password,
                            textInputType: TextInputType.visiblePassword,
                            requireInput: '',
                            hint: 'Mật khẩu',
                            security: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: SvgPicture.asset(SvgImageAssets.iconblock,height: 15,),
                            ),
                          ),
                          SizedBox(
                            height: SpaceValues.space12,
                          ),
                          GlobalInputFormWidget(
                            controller: viewModel.confirmPass,
                            validator:  (valueDy) => Validator.rePassword(valueDy, viewModel.password.text),
                            hint: 'Nhập lại mật khẩu',
                            requireInput: '',
                            security: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: SvgPicture.asset(SvgImageAssets.iconblock,height: 15,),
                            ),
                          ),
                        ],
                      )
                  ),

                  SizedBox(
                    height: SpaceValues.space24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        viewModel.onSignUp();
                        // Get.to(OTPScreen());
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
  SignUpModel createViewModel() => getIt<SignUpModel>();
}
