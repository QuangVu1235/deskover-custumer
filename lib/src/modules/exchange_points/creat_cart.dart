import 'dart:ui';

import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/exchange_points/cart_model.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_image.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../../config/assets/icon_assets.dart';
import '../../config/assets/image_asset.dart';
import '../../themes/space_values.dart';
import '../../themes/ui_colors.dart';

class CreateChangePointCart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CreateChangePointCart();

}
class _CreateChangePointCart extends ViewWidget<CreateChangePointCart,CartModel>{
  final formatCurrency = NumberFormat.currency(locale:"vi_VN", symbol: "đ");

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Giỏ hàng'),
         backgroundColor: UIColors.white  ,
       ),
      body: Container(
        margin: const EdgeInsets.only(top: 1),
        color: UIColors.white,
        child: Column(
          children: [
            Obx(
                ()=>Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: ListView(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.dataCartResponse.length,
                              itemBuilder: (context, int index) {
                                return Card(
                                  elevation: 0.0,
                                  margin: EdgeInsets.zero,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.3,
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: GlobalImage(BaseApi.baseUrl_product+'${viewModel.dataCartResponse[index].product?.img}') ,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10,10,10,10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                   Expanded(
                                                     child: Text(
                                                      viewModel.dataCartResponse[index].product?.name ?? '',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700
                                                      ),
                                                  ),
                                                   ),
                                                  const SizedBox(width: 26,),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 24,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        onSurface: Colors.red,
                                                        minimumSize: Size.zero, // Set this
                                                        padding: EdgeInsets.zero, // and this
                                                        primary: UIColors.white,
                                                        elevation: 0.0,
                                                      ),
                                                      onPressed: () async => await viewModel.btnDelete('minhbd', viewModel.dataCartResponse[index].product?.id ?? 0),
                                                      child: SvgPicture.asset(SvgImageAssets.trash,height: 20),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: SpaceValues.space16,),
                                              //thêm loại thẻ
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Giá:',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,

                                                    ),
                                                  ),
                                                   const SizedBox(width: 6,),
                                                   Text(
                                                     formatCurrency.format(viewModel.dataCartResponse[index].product?.price),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,

                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: SpaceValues.space4,),
                                              //kun vận động
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Số lượng:',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w400,

                                                    ),
                                                  ),
                                                  const Expanded(child: SizedBox(),),

                                                  SizedBox(
                                                    height: 25 ,
                                                    width: 25,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          primary: UIColors.red,
                                                          minimumSize: Size.zero, // Set this
                                                          padding: EdgeInsets.zero, // and this
                                                          elevation: 0.0,
                                                          shadowColor: Colors.transparent,
                                                          shape:   RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20),
                                                              side: BorderSide(color: UIColors.black10,width: 1)
                                                          )
                                                      ),
                                                      onPressed: viewModel.dataCartResponse[index].quantity! > 1 ? () async {
                                                        await viewModel.btnMinusCart('minhbd', viewModel.dataCartResponse[index].product?.id ?? 0);
                                                      }: null,
                                                      child: Center(child: SvgPicture.asset(SvgImageAssets.minus,color: UIColors.white,height: 16,)),
                                                    ),
                                                  ),
                                                  SizedBox(width: SpaceValues.space8,),
                                                  Obx(
                                                       ()=>SizedBox(
                                                            height: 25,
                                                            child:  Padding(
                                                              padding: const EdgeInsets.only(left: 15,right: 15),
                                                              child: Center(child: Text(viewModel.dataCartResponse[index].quantity.toString(),style: TextStyle(fontSize:12 ),)),
                                                            ),
                                                          ),),

                                                  const SizedBox(width: SpaceValues.space8,),
                                                  SizedBox(
                                                    height: 25 ,
                                                    width: 25,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          minimumSize: Size.zero, // Set this
                                                          padding: EdgeInsets.zero, // and this
                                                          elevation: 0.0,
                                                          shadowColor: Colors.transparent,
                                                          shape:   RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(20),
                                                              side: BorderSide(color: UIColors.black10,width: 1)
                                                          )
                                                      ),
                                                      onPressed: viewModel.dataCartResponse[index].quantity! <10 ? () async {
                                                        await viewModel.btnAddToCart('minhbd', viewModel.dataCartResponse[index].product?.id ?? 0);
                                                      }:null,
                                                      child: Center(child: SvgPicture.asset(SvgImageAssets.plus,color: UIColors.white,height: 16,)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 10,),
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center
                                ),
                                onPressed: (){

                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(SvgImageAssets.qrCode,height: 25,color: UIColors.white,),
                                    const SizedBox(width: SpaceValues.space16,),
                                    const Text(
                                      'Thêm sản phẩm',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: SpaceValues.space12,),
                            const Text(
                              'Giá trị đơn quà',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: SpaceValues.space12,),
                            Card(
                              elevation: 0.0,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Tổng số thẻ quà Kun quy đổi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text(
                                          '24',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        ),
                                        Text(
                                          ' thẻ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Tổng số thẻ Kun vận động quy đổi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        Text(
                                          '24',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        ),
                                        Text(
                                          ' thẻ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            //Thông tin người nhận
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //  ListTile(
                                //   dense: true,
                                //   minVerticalPadding: 0,
                                //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                //   contentPadding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                                //   title: Text(
                                //     "Địa chỉ nhận hàng",
                                //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                //   ),
                                //   tileColor: Colors.transparent,
                                //   onTap: null, // viewModel.selectedAddress,
                                // ),
                                const Text(
                                  'Thông tin người nhận',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      onSurface: UIColors.brandA,
                                      primary: UIColors.brandA,
                                    ) ,
                                    onPressed: (){

                                    }
                                    , child: Row(
                                  children: [
                                    SvgPicture.asset(SvgImageAssets.driveFileRename,color: UIColors.brandA,height: 20,),
                                    Text(' Thay đổi',style: TextStyle(color: UIColors.brandA,fontSize: 12,fontWeight: FontWeight.w400),)
                                  ],

                                ))



                              ],
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            Card(
                              elevation: 0.0,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(

                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Người nhận',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12
                                          ),
                                        ),
                                        Text(
                                          'Lâm Thu Đang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Số điện thoại',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12
                                          ),
                                        ),
                                        Text(
                                          '0335 965 865',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  [
                                        Text(
                                          'Địa chỉ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12
                                          ),
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.2),
                                        const Expanded(
                                          child: Text(
                                            'dsd, Phường Thạnh Xuân, Quận 12, Thành phố Hồ Chí Minh',
                                            // maxLines: 3,
                                            // overflow: TextOverflow.fade,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Nhận tại điểm đổi quà',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            Card(
                              elevation: 0.0,
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: const EdgeInsets.all(SpaceValues.space16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(IconAssets.actionStore, color: UIColors.brandA, width: 24,),
                                        SizedBox(width: SpaceValues.space12,),
                                        const Text(
                                          'Nhận tại điểm đổi quà',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14
                                          ),
                                        ),
                                        Expanded(child: SizedBox()),
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              onSurface: UIColors.brandA,
                                              primary: UIColors.brandA,
                                            ) ,
                                            onPressed: (){

                                            }
                                            , child: Checkbox(
                                            checkColor: Colors.white,
                                            shape: CircleBorder(),
                                            value: isChecked,
                                            onChanged: (bool? value){
                                              setState(() {
                                                if(isChecked){
                                                  isChecked = true;
                                                }
                                                isChecked = value!;

                                              });
                                            },
                                            activeColor: UIColors.brandA,
                                          ),
                                          ),
                                        )
                                      ],),
                                    SizedBox(width: SpaceValues.space12,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:  const [
                                        Text(
                                          'Địa chỉ: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'dsd, Phường Thạnh Xuân, Quận 12, Thành phố Hồ Chí Minh',
                                            // maxLines: 3,
                                            // overflow: TextOverflow.fade,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Ghi chú',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(height: SpaceValues.space12,),
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: 'Nhập ghi chú (nếu có)',

                                  hintStyle: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                  floatingLabelAlignment: FloatingLabelAlignment.center
                              ),
                              minLines: 3,
                              maxLines: 3,
                            ),
                            const SizedBox(height: SpaceValues.space48,),
                          ],
                        ),
                      ),
                    ),),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Row(
                  children: [
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
                          onPressed: (){

                          },
                          child: Text(
                              'Xoá giỏ quà',
                              style: TextStyle(
                                color: UIColors.red
                              ),
                          )),
                    ),
                    SizedBox(width: 8,),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                              // elevation: 0.0,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),

                              )
                          ) ,
                          onPressed: (){

                          },
                          child: Text(
                            'Xác nhận đơn quà',
                            style: TextStyle(

                            ),
                          )),
                    )
                  ],
                ),
              )

            //button add product

          ],
        ),
      ),
    );

  }

  @override
  CartModel createViewModel() => getIt<CartModel>();

}