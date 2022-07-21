import 'package:deskover_develop/src/apis/cart/cart_datasource.dart';
import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CartUserCase{
  final CartDataSource _cartDataSource;

  @factoryMethod
  CartUserCase(this._cartDataSource);

  Future<MessageResponse> addToCart(String username, int productId, int quantity)
  => _cartDataSource.addToCart(username, productId, quantity);

  Future<MessageResponse> minusCart(String username, int productId)
  => _cartDataSource.minusCart(username, productId);

  Future<MessageResponse> deleteCart(String username, int productId)
  => _cartDataSource.deleteCart(username, productId);

  Future<List<Cart>?> doGetAllCartOrder(String username)
  => _cartDataSource.doGetAllCartOrder(username);


}