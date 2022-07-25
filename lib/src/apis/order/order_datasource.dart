import 'package:deskover_develop/src/apis/order/request/order_resquest.dart';
import 'package:deskover_develop/src/apis/order/service/order_api.dart';
import 'package:injectable/injectable.dart';

abstract class OrderDataSource{
  Future<void> addOrder(OrderResquest orderResquest);

}
@LazySingleton(as: OrderDataSource)
class OrderDataSourceImpl extends OrderDataSource{
  final OrderAPI _orderAPI;

  OrderDataSourceImpl(this._orderAPI);

  @override
  Future<void> addOrder(OrderResquest orderResquest)
  => _orderAPI.addOrder(orderResquest);

}