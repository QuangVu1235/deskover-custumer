import 'dart:io';
import 'package:deskover_develop/src/config/assets/image_asset.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_image.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_input_form_widget.dart';
import 'package:deskover_develop/src/modules/profile/setting/password/change_password.dart';
import 'package:deskover_develop/src/modules/profile/setting/setting_profile_model.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({Key? key}) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfile();
}

class _SettingProfile extends ViewWidget<SettingProfile, SettingProfileModel> {
  bool _isVisible = true;
  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: UIColors.white,
        shape: const Border(bottom: BorderSide(color: UIColors.border10)),
      ),
      // backgroundColor: UIColors.white,
      body: Column(
        children: [
          Expanded(child: RefreshIndicator(
            onRefresh: ()=> viewModel.loadProfiled(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color:UIColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(SpaceValues.space16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              ImagePicker ip = ImagePicker();
                              ip.pickImage(source: ImageSource.gallery).then((value) {
                                viewModel.imgUpload.value = value;
                              });
                            },
                            child: Obx(
                                  () => Visibility(
                                visible: null != viewModel.imgUpload.value?.path,
                                child: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: UIColors.black,
                                        radius: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: ClipOval(
                                            child: Image.file(
                                              File(viewModel.imgUpload.value?.path ?? ''),
                                              fit: BoxFit.cover,
                                              width: 120,
                                              height: 120,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            backgroundColor: UIColors.white,
                                          )),
                                      const Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: UIColors.black,
                                          ))
                                    ],
                                  ),
                                ),
                                replacement: Center(
                                  child: Stack(
                                    children: <Widget>[
                                      Visibility(
                                        // visible:viewModel.avartar.isNotEmpty ,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: ClipOval(
                                              child: Image.network(
                                                BaseApi.baseUrlUser+'${viewModel.user.value?.avatar}',
                                                fit: BoxFit.cover,
                                                width: 120,
                                                height: 120,
                                                errorBuilder: (BuildContext context, Object exception,
                                                    StackTrace? stackTrace) {
                                                  return Image.asset(
                                                    ImageAssets.imgPlaceholder,
                                                    fit: BoxFit.cover,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            backgroundColor: UIColors.white,
                                          )),
                                      const Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: UIColors.black,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /////////////////////////////////
                          const SizedBox(height: SpaceValues.space24),
                          Form(
                              key: viewModel.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GlobalInputFormWidget(
                                    controller: viewModel.fullname,
                                    title: 'Tên',
                                    hint: 'Nguyễn Văn A',
                                    textInputType: TextInputType.name,
                                    requireInput: '',
                                    validator: Validator.fullnameCanEmpty,
                                    suffixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                    ),
                                  ),
                                  const SizedBox(height: SpaceValues.space24),
                                  GlobalInputFormWidget(
                                    readOnly: true,
                                    controller: viewModel.id,
                                    requireInput: '',
                                    title: 'ID',
                                    hint: 'id...',
                                    textInputType: TextInputType.phone,
                                  ),
                                  const SizedBox(height: SpaceValues.space24),
                                  GlobalInputFormWidget(
                                    readOnly: true,
                                    controller: viewModel.phone,
                                    requireInput: '',
                                    title: 'Số điện thoại',
                                    hint: '(Không tìm thấy số điện thoại)',
                                    textInputType: TextInputType.phone,
                                  ),
                                  const SizedBox(height: SpaceValues.space24),
                                  GlobalInputFormWidget(
                                    readOnly: false,
                                    controller: viewModel.email,
                                    validator: Validator.emailCanEmpty,
                                    textInputType: TextInputType.emailAddress,
                                    requireInput: '',
                                    title: 'Email',
                                    hint: '(Chưa có email)',
                                    suffixIcon: const Icon(
                                      Icons.drive_file_rename_outline,
                                    ),
                                  ),
                                  const SizedBox(height: SpaceValues.space24),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 150,)
                ],
              ),
            ),
          )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: UIColors.white,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: UIColors.brandA, minimumSize: const Size(0, 48)),
              onPressed: () {
                viewModel.updateProfile();
              },
              child: const Text(
                "Cập nhật thông tin",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            color: UIColors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: InkWell(
                onTap: () => Get.to(ChangePasswordScreen()),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                     color: UIColors.white,
                      border: Border.all(color: Color(0xB2000000)),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    "Thay đổi mật khẩu",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xB2000000),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SettingProfileModel createViewModel() => getIt<SettingProfileModel>();
}
