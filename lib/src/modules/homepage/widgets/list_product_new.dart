import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/modules/homepage/homepage_model.dart';
import 'package:deskover_develop/src/modules/homepage/homepage_screen.dart';
import 'package:deskover_develop/src/modules/product_widget/product_widget.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ListProductNew extends StatelessWidget{

  final HomePageModel viewModel;
  final String? title;

  const ListProductNew({Key? key, required this.viewModel, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return   Scaffold(
        appBar: AppBar(
          title: Text(title ?? ''),
          backgroundColor: UIColors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                    ()=>
                        ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 256),
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: viewModel.dataProductNew.value.length,
                    itemBuilder: (context, index)
                      => InkWell(
                        onTap: ()=> Get.to(()=> HomePage()),
                        child: ProductWidget(
                          productId:  viewModel.dataProductNew[index].id!,
                          title: viewModel.dataProductNew[index].name ?? '',
                          avatar: BaseApi.baseUrl+'/img/shop/products/${viewModel.dataProductNew[index].img}',
                          price: viewModel.dataProductNew[index].price!,
                          quantity: viewModel.dataProductNew[index].quantity!,
                        ),
                      ),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 2,
                      crossAxisCount: 2,
                      mainAxisExtent: 270,
                      // childAspectRatio: 0.4,
                    ),

                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                viewModel.size.value = viewModel.size.value + 8;
                viewModel.loadProductNew();
              },
              child: Text(
                "Xem thêm >",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: UIColors.brandA),
              ),
            )
          ],
        ),
      );
  }

}