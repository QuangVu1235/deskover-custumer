import 'package:deskover_develop/src/apis/cart/cart_datasource.dart';
import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:deskover_develop/src/apis/user_addrees/response/user_address.dart';
import 'package:deskover_develop/src/apis/user_addrees/user_address_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CartUserCase{
  final CartDataSource _cartDataSource;
  final UserAddressDataSource _userAddressDataSource;

  @factoryMethod
  CartUserCase(this._cartDataSource, this._userAddressDataSource);

  Future<MessageResponse> addToCart(String username, int productId, int quantity)
  => _cartDataSource.addToCart(username, productId, quantity);

  Future<MessageResponse> minusCart(String username, int productId)
  => _cartDataSource.minusCart(username, productId);

  Future<MessageResponse> deleteCart(String username, int productId)
  => _cartDataSource.deleteCart(username, productId);

  Future<List<Cart>?> doGetAllCartOrder(String username)
  => _cartDataSource.doGetAllCartOrder(username);

 
  Future<List<UserAddress>?> changeActive(int id, String username)
  => _userAddressDataSource.changeActive(id, username);

 
  Future<MessageResponse> changeChoose(int id, String username)
  => _userAddressDataSource.changeChoose(id, username);

 
  Future<List<UserAddress>?> doGetAddress(String username)
  => _userAddressDataSource.doGetAddress(username);
 
  Future<MessageResponse> doPostAddress(UserAddress userAddress, String username)
  => _userAddressDataSource.doPostAddress(userAddress, username);


}