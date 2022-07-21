import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/apis/cart/service/cart_api.dart';
import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:injectable/injectable.dart';

abstract class CartDataSource{
  Future<MessageResponse> addToCart(String username,int productId, int quantity );
  Future<MessageResponse> minusCart(String username,int productId);
  Future<MessageResponse> deleteCart(String username,int productId);
  Future<List<Cart>?> doGetAllCartOrder(String username);
}
@LazySingleton(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource{
  final CartAPI _cartAPI;

  CartDataSourceImpl(this._cartAPI);
  @override
  Future<MessageResponse> addToCart(String username, int productId, int quantity)
  => _cartAPI.addToCart(username, productId, quantity);

  @override
  Future<List<Cart>?> doGetAllCartOrder(String username)
  => _cartAPI.doGetAllCartOrder(username);

  @override
  Future<MessageResponse> minusCart(String username, int productId)
  => _cartAPI.minusCart(username,productId);

  @override
  Future<MessageResponse> deleteCart(String username, int productId)
  => _cartAPI.deleteCart(username, productId);


}