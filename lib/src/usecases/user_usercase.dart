import 'package:deskover_develop/src/apis/login/login_datasource.dart';
import 'package:deskover_develop/src/apis/user/response/user_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class UserUserCase{
  final LoginDataSource _loginDataSource;

  @factoryMethod
  UserUserCase(this._loginDataSource);

  Future<User> doGetProfiled()
  => _loginDataSource.doGetProfiled();



}