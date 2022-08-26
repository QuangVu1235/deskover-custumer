import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/signin_signup/reset_pass/app/reset_pass_model.dart';
import 'package:deskover_develop/src/modules/signin_signup/reset_pass/app/success_pass.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../config/assets/image_asset.dart';
import '../../../../themes/space_values.dart';
import '../../../../themes/ui_colors.dart';
import '../../../global_modules/widget/global_input_form_widget.dart';

class ResetPassword extends StatefulWidget {
  final String phone;
  const ResetPassword({Key? key, required this.phone}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ViewWidget<ResetPassword, ResetPassModel> {
  @override
  void initState() {
    super.initState();
    viewModel.inputPhone.text = widget.phone;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: UIColors.login,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                children: [
                  SizedBox(height: SpaceValues.space12,),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 50),
                          margin: EdgeInsets.all(20),
                          child: Center(
                            child:  Image.asset( ImageAssets.secure_login, height: 223),
                          ),
                        ),
                        SizedBox(height: 120,),
                        Text('Thiết lập lại mật khẩu?',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: SpaceValues.space12,
                        ),
                        GlobalInputFormWidget(
                          controller: viewModel.password,
                          validator: Validator.password,
                          textInputType: TextInputType.visiblePassword,
                          security: true,
                          hint: 'Nhập mật khẩu mới',
                          requireInput: '',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset(SvgImageAssets.iconblock,height: 15,),
                          ),
                        ),

                        SizedBox(
                          height: SpaceValues.space12,
                        ),
                        GlobalInputFormWidget(
                          controller: viewModel.newPassword,
                          validator:  (valueDy) => Validator.rePassword(valueDy, viewModel.password.text),
                          hint: 'Nhập lại mật khẩu',
                          security: true,
                          requireInput: '',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: SvgPicture.asset(SvgImageAssets.iconblock,height: 15,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                           viewModel.confirmNewPassword();
                        },
                        child:const Padding(
                          padding:  EdgeInsets.only(top: SpaceValues.space8,bottom: SpaceValues.space8 ),
                          child: Text("Xác nhận"),
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  @override
  ResetPassModel createViewModel() => getIt<ResetPassModel>();
}
