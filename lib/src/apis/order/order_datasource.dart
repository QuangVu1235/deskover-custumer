import 'package:deskover_develop/src/apis/message_response.dart';
import 'package:deskover_develop/src/apis/order/request/order_resquest.dart';
import 'package:deskover_develop/src/apis/order/service/order_api.dart';
import 'package:injectable/injectable.dart';

abstract class OrderDataSource{
  Future<MessageResponse> addOrder(OrderResquest orderResquest);

}
@LazySingleton(as: OrderDataSource)
class OrderDataSourceImpl extends OrderDataSource{
  final OrderAPI _orderAPI;

  OrderDataSourceImpl(this._orderAPI);

  @override
  Future<MessageResponse> addOrder(OrderResquest orderResquest)
  => _orderAPI.addOrder(orderResquest);

}