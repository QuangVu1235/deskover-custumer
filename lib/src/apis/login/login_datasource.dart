import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/apis/cart/service/cart_api.dart';
import 'package:deskover_develop/src/apis/login/service/login_api.dart';
import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:injectable/injectable.dart';

abstract class LoginDataSource{
  Future<MessageResponse> doLogin(String username, String password);

}
@LazySingleton(as: LoginDataSource)
class LoginDataSourceImpl extends LoginDataSource{
  final LoginAPI _loginAPI;

  LoginDataSourceImpl(this._loginAPI);

  @override
  Future<MessageResponse> doLogin(String username, String password)
  => _loginAPI.doLogin({
          "username": username,
          "password": password
      });


}