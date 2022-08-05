import 'package:deskover_develop/src/config/assets/icon_assets.dart';
import 'package:deskover_develop/src/config/assets/image_asset.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_image.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import 'order_manager_model.dart';

class OrderManager extends StatefulWidget{
  final String orderCode;
  const OrderManager({Key? key, required this.orderCode}) : super(key: key);

  @override
  State<OrderManager> createState() => _OrderManager();

}
class _OrderManager extends ViewWidget<OrderManager,OrderManagerModel>{
  @override
  void initState() {
    super.initState();
    viewModel.orderCode.value = widget.orderCode;
    viewModel.loadOrder();
  }
  final formatCurrency = NumberFormat.currency(locale:"vi_VN", symbol: "đ");
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text('Quản lý đơn hàng'),
          backgroundColor: UIColors.white,
          centerTitle: true,
        ),
        body: Obx(()=>
           Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 6),
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
                            child: Image.asset(
                              SvgImageAssets.icInfomation0,
                              color: UIColors.white,
                              width: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: viewModel.indexAction.value >=1 ? Divider(height: 50, thickness: 3, color: UIColors.brandA) : SizedBox(),
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
                              color: viewModel.indexAction.value >= 1 ? UIColors.white : UIColors.black70,
                            ),
                          ),
                        )),
                        Expanded(
                          child:viewModel.indexAction.value >=2 ? Divider(height: 50, thickness: 3, color: UIColors.brandA) : const SizedBox(),
                        ),
                        Obx(() => AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: UIColors.brandA,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: viewModel.indexAction.value >= 2 ? UIColors.brandA : UIColors.white,
                            child: SvgPicture.asset(
                              SvgImageAssets.icInfomation2,
                              width: 30,
                              color: viewModel.indexAction.value >= 2 ? UIColors.white : UIColors.black,
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
            viewModel.orderReponese.value != null ?
            Expanded(
              flex: 2,
              child:
              Obx(()=>   Visibility(
                visible: viewModel.orderReponese.value != null,
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  color: UIColors.white,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child:Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Card(
                              elevation: 0.0,
                              margin:  EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    style: BorderStyle.solid,
                                    color: UIColors.black10,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Mã vận đơn:',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: UIColors.black,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            viewModel.orderReponese.value?.orderCode ?? '',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: UIColors.black,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 24,),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: UIColors.yellow40,
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color: UIColors.yellow,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: SpaceValues.space16,
                                          ),
                                          Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children:  [
                                                  const Text(
                                                    'Địa chỉ giao hàng:',
                                                    style: TextStyle(
                                                        color: UIColors.black70,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w700),
                                                  ),
                                                  SizedBox(height: 4,),
                                                  Text(
                                                    viewModel.orderReponese.value?.orderDetail?.address ?? '',
                                                    style: const TextStyle(
                                                        color: UIColors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: SpaceValues.space16,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  [
                                          const Icon(
                                            Icons.local_offer_outlined,
                                            color: UIColors.error80,
                                          ),
                                          const SizedBox(
                                            width: SpaceValues.space4,
                                          ),
                                          Text(
                                            formatCurrency.format(viewModel.orderReponese.value?.unitPrice),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: UIColors.black,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            width: SpaceValues.space24,
                                          ),
                                          const Icon(
                                            Icons.access_time,
                                            color: UIColors.brandA,
                                          ),
                                          const SizedBox(
                                            width: SpaceValues.space4,
                                          ),
                                          Text(
                                            viewModel.orderReponese.value?.createdAt?.substring(0,10) ?? '',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: UIColors.black,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: SpaceValues.space16,
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: viewModel.orderReponese.value?.products?.length ?? 0,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Card(
                                            elevation: 0.0,
                                            margin: EdgeInsets.zero,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width*0.2,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: GlobalImage(BaseApi.baseUrl_product+ (viewModel.orderReponese.value?.products?[index].product?.img ?? '')),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          viewModel.orderReponese.value?.products?[index].product?.name ?? '',
                                                          textAlign: TextAlign.end,
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Text(
                                                          'x ${viewModel.orderReponese.value?.products?[index].quantity}',
                                                          textAlign: TextAlign.end,
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Text(
                                                          'Giá: ${formatCurrency.format(viewModel.orderReponese.value?.products?[index].price)}',
                                                          textAlign: TextAlign.end,
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),

                                          );
                                        },
                                        separatorBuilder: (context, index) => const SizedBox(height: 10,),

                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                replacement: Text('...'),
              ),),

            )
            : Text('..'),
            const Divider(color: UIColors.black70,height: 2),
            Expanded(
              flex: 2,
              child: Container(
                  color: UIColors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text('Trạng thái đơn hàng'),
                    ],
                  )),
            )

          ],
        ),)

      );
  }

  @override
  OrderManagerModel createViewModel() => getIt<OrderManagerModel>();
}