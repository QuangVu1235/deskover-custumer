import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/apis/order/request/order_resquest.dart';
import 'package:deskover_develop/src/apis/shipping_payment_status/response/shipping_payment_status.dart';
import 'package:deskover_develop/src/apis/user_addrees/response/user_address.dart';
import 'package:deskover_develop/src/modules/main_page.dart';
import 'package:deskover_develop/src/modules/main_page_model.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/usecases/cart_usercase/cart_usercase.dart';
import 'package:deskover_develop/src/usecases/order/order_usercase.dart';
import 'package:deskover_develop/src/utils/AppUtils.dart';
import 'package:deskover_develop/src/utils/widgets/view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class CartModel extends ViewModel{
  final CartUserCase _cartUserCase;
  final MainPageModel _mainPageModel;
  final OrderUserCase _orderUserCase;

  RxList<Cart> dataCartResponse = RxList.empty();
  RxList<UserAddress> dataAddress = RxList.empty();
  Rxn<UserAddress> address = Rxn();
  RxList<Shipping> dataShipping = RxList.empty();
  Rxn<Shipping> shipping = Rxn();
  RxList<Payment> dataPayment = RxList.empty();
  Rxn<Payment> payment = Rxn();

  TextEditingController inputNote = TextEditingController();


  CartModel(this._cartUserCase, this._mainPageModel, this._orderUserCase);

  @override
  void initState() {
    super.initState();
    loadCartOrder('minhbd');
    loadAddress('minhbd');
    loadShippingMethod();
    loadPaymentMethod();
  }

  Future<void> loadShippingMethod() async {
    await _cartUserCase.doGetShipping().then((value) async{
           dataShipping.value = value ?? [];
           shipping.value = null as Shipping?;
           // dataShipping.value.forEach((element) {
           //   if(element.shipping_id == 'DKV'){
           //     shipping.value = element;
           //   }
           // });
    });
  }
  Future<void> loadPaymentMethod() async {
    await _cartUserCase.doGetPayment().then((value) async{
      dataPayment.value = value ?? [];
      payment.value = null as Payment?;
    });
  }

  Future<void> loadAddress(String username) async {
    await _cartUserCase.doGetAddress(username).then((value) async{
        dataAddress.value = value ?? [];
        dataAddress.value.forEach((item) {
            if(item.choose == true){
              address.value = item;
            }
        });
    });
  }

  Future<void> loadCartOrder(String username) async{
    await _cartUserCase.doGetAllCartOrder(username).then((value) async{
          dataCartResponse.value = value ?? [];
           _mainPageModel.itemCart.value = dataCartResponse.value.length;
           print('_mainPageModel.itemCart.value');
          print(_mainPageModel.itemCart.value);
          if(dataCartResponse.value.isEmpty){
              AppUtils().showPopup(
                title: 'Giỏ hàng trống',
                action: [
                  ElevatedButton(
                      onPressed: (){
                          Get.offAll(MainPage(indexTab: 0,));
                      },
                      child: Text('Tới trang mua sắm'))

                  ]
              );
          }
    });
  }
  OrderResquest? request;
  Future<void> btnConfirmOrder() async {
    request=OrderResquest(
      payment: payment.value,
      shipping: shipping.value,
      note: inputNote.text
    );
    loading(() async{
      await _orderUserCase.addOrder(request!).then((value) async{
        await AppUtils().showPopup(
            title: 'Đặt hàng thành công',
            isSuccess: true,
            subtitle: value.message ?? '',
            action: [
              SizedBox(
                width: MediaQuery.of(Get.context!).size.width * .5,
                child: ElevatedButton(
                  onPressed:()=> Get.offAll(MainPage(indexTab: 0,)),
                  child: const Text('Xác nhận'),
                ),
              ),
            ]
          );
      });
    });

  }
  Future<void> btnAddToCart(String username, int productId) async{
      await _cartUserCase.addToCart(username, productId, 1).then((value) async{
        Fluttertoast.showToast(msg: value.message.toString(), backgroundColor: UIColors.black70);
        await loadCartOrder(username);
      });
  }

  Future<void> btnMinusCart(String username, int productId) async{
      await _cartUserCase.minusCart(username, productId).then((value) async{
        await loadCartOrder(username);
        // Fluttertoast.showToast(msg: value.message.toString(), backgroundColor: UIColors.black70);
      });
  }
  Future<void> btnChooseAddress(int id,  username)async {
    await _cartUserCase.changeChoose(id, username).then((value) async{
        await loadAddress(username);
        Get.back();
    });
  }
  Future<void> btnDelete(String username, int productId) async{
    await AppUtils().showPopup(
      isSuccess: false,
      title: 'Bạn có muốn xoá sản phẩm \nkhỏi giỏ hàng',
      action: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: (){
                      Get.back();
                    },
                    child: Text('Huỷ')),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: UIColors.white,
                        // elevation: 0.0,
                        shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: UIColors.red,width: 1)
                        )
                    ) ,
                    onPressed: () async {
                      await _cartUserCase.deleteCart(username, productId).then((value) async{
                        Fluttertoast.showToast(msg: value.message.toString(), backgroundColor: UIColors.black70);
                      });
                      await loadCartOrder(username);
                      Get.back();
                    },
                    child: const Text(
                      'Xoá',
                      style: TextStyle(
                          color: UIColors.red
                      ),
                    )),
              )
            ],
          ),
        )
      ]
    );
  }
  void checkShipping(){
    if(address.value?.province_id?.code != 'SG'){
      if(shipping.value?.shipping_id == 'DKV'){
        AppUtils().showPopup(
            isSuccess: false,
            title: 'Vị trí của bạn không hỗ trợ được giao',
            subtitle: 'Đơn vị miễn phí vận chuyển khu vực\nTP.Hồ Chí Minh'
        );
        shipping.value = null;
      }
    }
  }

}