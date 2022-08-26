import 'dart:io';

import 'package:deskover_develop/src/apis/login/login_datasource.dart';
import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:deskover_develop/src/apis/user/response/user_response.dart';
import 'package:deskover_develop/src/apis/user_addrees/user_address_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserUserCase{
  final LoginDataSource _loginDataSource;
  final UserAddressDataSource _userAddressDataSource;

  @factoryMethod
  UserUserCase(this._loginDataSource, this._userAddressDataSource);

  Future<User> doGetProfiled()
  => _loginDataSource.doGetProfiled();

  Future<MessageResponse> changePassword(body)
  => _userAddressDataSource.changePassword(body);

  Future<void> doPostUploadFile(File file)
  => _loginDataSource.doPostUploadFile(file);

  Future<MessageResponse> doPutUpdate(User user)
  => _loginDataSource.doPutUpdate(user);

  Future confirmOTP(String otp, String phone)
  => _loginDataSource.confirmOTP(otp, phone);

  Future doPostCreateUser(user)
  => _loginDataSource.doPostCreateUser(user);

  Future resendOTP(String phone)
  => _loginDataSource.resendOTP(phone);

  Future confirmPassReset(String phone, String password, String comfirmPass)
  => _loginDataSource.confirmPassReset(phone, password, comfirmPass);





}