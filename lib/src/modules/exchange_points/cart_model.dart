import 'package:deskover_develop/src/apis/cart/response/cart_response.dart';
import 'package:deskover_develop/src/modules/main_page_model.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/usecases/cart_usercase/cart_usercase.dart';
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

  RxList<Cart> dataCartResponse = RxList.empty();

  CartModel(this._cartUserCase, this._mainPageModel);

  @override
  void initState() {
    super.initState();
    loadCartOrder('minhbd');
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
                          Get.back();
                      },
                      child: Text('Tới trang mua sắm'))

                  ]
              );
          }
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

}