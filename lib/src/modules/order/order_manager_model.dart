import 'package:deskover_develop/src/apis/notify/service/notify_api.dart';
import 'package:deskover_develop/src/apis/order/order_datasource.dart';
import 'package:deskover_develop/src/apis/order/request/order/order_response.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderManagerModel extends ViewModel{
  final OrderDataSource _orderDataSource;
  final NotifyApi _notifyApi;
  RxString orderCode = ''.obs;
  RxInt indexAction = 0.obs;
  Rxn<OrderReponse> orderReponese  = Rxn();

  OrderManagerModel(this._orderDataSource, this._notifyApi);

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadOrder()async {
    await _orderDataSource.getOrderByUser(orderCode.value).then((value){
      orderReponese.value = value;
      if(orderReponese.value?.orderStatus?.code == 'C-LH'){
        indexAction.value = 0;
      }else if(orderReponese.value?.orderStatus?.code == 'DG'){
        indexAction.value = 1;
      }else if(orderReponese.value?.orderStatus?.code == 'GH-TC'){
        indexAction.value = 2;
      }else{
        indexAction.value = 0;
      }
    });
  }


}