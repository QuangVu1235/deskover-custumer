import 'package:deskover_develop/src/config/assets/icon_assets.dart';
import 'package:deskover_develop/src/config/assets/image_asset.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'order_manager_model.dart';

class OrderManager extends StatefulWidget{
  final String? orderCode;
  const OrderManager({Key? key, this.orderCode}) : super(key: key);

  @override
  State<OrderManager> createState() => _OrderManager();

}
class _OrderManager extends ViewWidget<OrderManager,OrderManagerModel>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          title: Text('Quản lý đơn hàng'),
          backgroundColor: UIColors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 6),
              color: UIColors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(SpaceValues.space32, SpaceValues.space16, SpaceValues.space32, SpaceValues.space16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: SpaceValues.space56,),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: UIColors.brandA,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: UIColors.brandA,
                            child: SvgPicture.asset(
                              IconAssets.actionAccountCircle,
                              color: UIColors.white,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(height: 50, thickness: 3, color: UIColors.brandA),
                        ),
                        Obx(() => AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: UIColors.brandA,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: viewModel.indexAction.value >= 1 ? UIColors.brandA : UIColors.white,
                            child: SvgPicture.asset(
                              SvgImageAssets.icInfomation1,
                              color: viewModel.indexAction.value >= 1 ? UIColors.white : null,
                            ),
                          ),
                        )),
                        const Expanded(
                          child: Divider(height: 50, thickness: 3, color: UIColors.brandA),
                        ),
                        Obx(() => AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: UIColors.brandA,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: viewModel.indexAction.value >= 2 ? UIColors.brandA : UIColors.white,
                            child: SvgPicture.asset(
                              'SvgImageAssets.icInfomation2',
                              color: viewModel.indexAction.value >= 2 ? UIColors.white : null,
                            ),
                          ),
                        )),
                        const SizedBox(width: SpaceValues.space56,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(width: 40,),
                        Text(
                          "Chờ xác nhận",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "Đang giao",
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 45,),
                        Text(
                          "Đã giao",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  @override
  OrderManagerModel createViewModel() => getIt<OrderManagerModel>();
}