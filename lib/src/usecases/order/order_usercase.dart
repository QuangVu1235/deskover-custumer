import 'package:deskover_develop/src/apis/order/order_datasource.dart';
import 'package:deskover_develop/src/apis/order/request/order_resquest.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OrderUserCase{
  final OrderDataSource _orderDataSource;

  @factoryMethod
  OrderUserCase(this._orderDataSource);

  Future<void> addOrder(OrderResquest orderResquest)
  => _orderDataSource.addOrder(orderResquest);
}