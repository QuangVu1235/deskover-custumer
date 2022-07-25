import 'package:deskover_develop/src/apis/user_addrees/response/user_address.dart';
import 'package:deskover_develop/src/apis/user_addrees/service/user_address_api.dart';
import 'package:injectable/injectable.dart';

import '../message_response.dart';

abstract class UserAddressDataSource{
  Future<List<UserAddress>?> doGetAddress( String username);
  Future<MessageResponse> doPostAddress(UserAddress userAddress, String username);
  Future<List<UserAddress>?> changeActive(int id, String username);
  Future<MessageResponse> changeChoose( int id, String username);

}
@LazySingleton(as: UserAddressDataSource)
class UserAddressDataSourceIpml extends UserAddressDataSource{

  final UserAddressApi _userAddressApi;
  UserAddressDataSourceIpml(this._userAddressApi);

  @override
  Future<List<UserAddress>?> changeActive(int id, String username)
  => _userAddressApi.changeActive(id, username);

  @override
  Future<MessageResponse> changeChoose(int id, String username)
  => _userAddressApi.changeChoose(id, username);

  @override
  Future<List<UserAddress>?> doGetAddress(String username)
  => _userAddressApi.doGetAddress(username);
  @override
  Future<MessageResponse> doPostAddress(UserAddress userAddress, String username)
  => _userAddressApi.doPostAddress(userAddress, username);




}