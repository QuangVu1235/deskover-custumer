import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/homepage/widgets/list_product_new.dart';
import 'package:deskover_develop/src/modules/product_widget/product_widget.dart';
import 'package:deskover_develop/src/modules/subcategory/subcategory_screen.dart';
import 'package:deskover_develop/src/themes/dialogs/loading_dialog.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../themes/ui_colors.dart';
import '../global_modules/widget/global_image.dart';
import 'homepage_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewWidget<HomePage,HomePageModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: ()=> viewModel.resfresh(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 7,
                child: ImageSlideshow(
                    width: double.infinity,
                    initialPage: 0,
                    indicatorColor: UIColors.brandA,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      //debugPrint('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: const [
                      GlobalImage(
                        'https://cdn2.cellphones.com.vn/690x300/https://dashboard.cellphones.com.vn/storage/690-300%20poco.png',
                        fit: BoxFit.fill,
                      ),
                      GlobalImage(
                        'https://cdn2.cellphones.com.vn/690x300/https://dashboard.cellphones.com.vn/storage/banner-huawei-tbvp.png',
                        fit: BoxFit.fill,
                      ),
                      GlobalImage(
                        'https://cdn2.cellphones.com.vn/690x300/https://dashboard.cellphones.com.vn/storage/CPS_690x300_19July22.jpg',
                        fit: BoxFit.fill,
                      )
                    ]),
              ),
              Container(
                color: UIColors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: SpaceValues.space16,
                    ),
                    const Center(
                      child: Text(
                        "DANH MỤC NỔI BẬT",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                    Obx(
                       ()=> Visibility(
                         visible: viewModel.DataCategory.value.length > 0,
                         child: SizedBox(
                           height: (viewModel.DataCategory.value.length) > 8
                               ? 230
                               : 230 / 2,
                           child: Center(
                             child: Obx(
                                   ()=> GridView.builder(
                                 // primary: false,
                                 shrinkWrap: true,
                                 scrollDirection: Axis.horizontal,
                                 // physics: const NeverScrollableScrollPhysics(),
                                 padding: const EdgeInsets.all(0),
                                 itemCount: viewModel.DataCategory.value.length,
                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: (viewModel.DataCategory.value.length) > 8
                                       ? 2
                                       : 1,
                                   mainAxisExtent: 80,
                                   childAspectRatio: 2,
                                   mainAxisSpacing: 12,
                                   crossAxisSpacing: 8,
                                 ),
                                 itemBuilder: (context, i) {
                                   return TextButton(
                                     style: TextButton.styleFrom(
                                         padding: EdgeInsets.zero,
                                         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                         minimumSize: Size.zero),
                                     onPressed: () {
                                       Get.to(()=> SubCategoryScreen(categoryId: viewModel.DataCategory[i].id!, title:  viewModel.DataCategory[i].name!,));
                                     },
                                     child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         ClipRRect(
                                           borderRadius: BorderRadius.circular(999),
                                           child: Container(
                                             color: UIColors.black10,
                                             child:  SvgPicture.network(
                                               BaseApi.baseUrl+'/img/shop/categories/${viewModel.DataCategory[i].img}',
                                               width: 53,
                                               height: 60,
                                               fit: BoxFit.none,
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           height: 31,
                                           child: Padding(
                                             padding: const EdgeInsets.symmetric(horizontal: 3),
                                             child: Text(
                                               viewModel.DataCategory.value[i].name ?? '',
                                               textAlign: TextAlign.center,
                                               maxLines: 2,
                                               overflow: TextOverflow.ellipsis,
                                               style: const TextStyle(
                                                 fontSize: 10,
                                                 fontWeight: FontWeight.w400,
                                                 color: UIColors.black,
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   );
                                 },
                               ),
                             ),

                           ),
                         ),
                         replacement: const Center(
                           child: LoadingDialog(
                             backgroundColor: Colors.transparent,
                             elevation: 0,
                             message: 'Đang tìm các danh mục...',
                           ),
                         ),
                       ),)

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: SpaceValues.space6),
                color: UIColors.white,
                child: Column(
                  children: [
                    Obx(
                            () {
                          return Visibility(
                            visible: viewModel.dataProductFlashSale.length > 0,
                            child: Visibility(
                              visible: (viewModel.dataProductFlashSale.value.length) > 0,
                              child: Container(
                                color: UIColors.brandA,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(16,12,16,0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "resources/icons/thunder.svg",
                                            height: 16,
                                            width: 16,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              '  Deal đang diễn ra',
                                              style: TextStyle(
                                                color: UIColors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(16,8,16,8),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Thời gian kết thúc',
                                              style: TextStyle(
                                                color: UIColors.white,
                                              ),
                                            ),
                                          ),
                                          CountdownTimer(
                                            endTime: DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                                                (viewModel.dataProductFlashSale.value).isNotEmpty ?
                                                //viewModel.dataProductFlashSale.value.first.flashSale?.endDate
                                                '2022-07-29 19:40:00'
                                                    : DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().add(const Duration(minutes: 1)))).millisecondsSinceEpoch,
                                            // endTime: DateFormat('yyyy-MM-dd HH:mm:ss').parse(viewModel.dataProductFlashSale.value.first.flashSale?.endDate.toString() ?? '2022-07-29 23:12:00').millisecondsSinceEpoch,
                                            onEnd: () async {
                                              await viewModel.loadProductSale();
                                            },

                                            widgetBuilder: (context, time) {
                                              // if (time == null) {
                                              //    // viewModel.loading(() async{
                                              //    //    viewModel.loadProductSale();
                                              //    // });
                                              //
                                              //    return Text("1");
                                              // }
                                              return Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: UIColors.white,
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Text(
                                                      (time?.hours ?? 0).toString().length < 2 ? '0${time?.hours ?? 0}' : '${time?.hours ?? 0}',
                                                      style: const TextStyle(
                                                        color: UIColors.brandA,
                                                      ),
                                                    ),
                                                  ),
                                                  const Text(
                                                    ' : ',
                                                    style: TextStyle(
                                                      color: UIColors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: UIColors.white,
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Text(
                                                      (time?.min ?? 0).toString().length < 2 ? '0${time?.min ?? 0}' : '${time?.min ?? 0}',
                                                      style: const TextStyle(
                                                        color: UIColors.brandA,
                                                      ),
                                                    ),
                                                  ),
                                                  const Text(
                                                    ' : ',
                                                    style: TextStyle(
                                                      color: UIColors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                                    decoration: BoxDecoration(
                                                      color: UIColors.white,
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Text(
                                                      (time?.sec ?? 0).toString().length < 2 ? '0${time?.sec ?? 0}' : '${time?.sec ?? 0}',
                                                      style: const TextStyle(
                                                        color: UIColors.brandA,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12,),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(maxHeight: 256),
                                      child: ListView.separated(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: viewModel.dataProductFlashSale.value.length,
                                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                                        itemBuilder: (context, index) {
                                          return ProductWidget(
                                            productId: viewModel.dataProductFlashSale.value[index].id ?? 0,
                                            avatar: BaseApi.baseUrl_product+ '${viewModel.dataProductFlashSale.value[index].img}',
                                            title: viewModel.dataProductFlashSale.value[index].name ?? '',
                                            isCanBuy: (viewModel.dataProductFlashSale.value[index].quantity ?? 0) > 0,
                                            quantity: viewModel.dataProductFlashSale.value[index].quantity ?? 0,
                                            promotion: '${viewModel.dataProductFlashSale.value[index].discount?.percent}%',
                                            discount: viewModel.dataProductFlashSale.value[index].discount?.percent ?? 0,
                                            price: (viewModel.dataProductFlashSale.value[index].discount?.percent) != 0
                                                ? viewModel.dataProductFlashSale.value[index].price! - (viewModel.dataProductFlashSale.value[index].price! * (viewModel.dataProductFlashSale.value[index].discount?.percent ?? 0)/100)
                                                :  viewModel.dataProductFlashSale.value[index].price ?? 0,
                                            priceOrigin:viewModel.dataProductFlashSale.value[index].price ?? 0,
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 16,),
                                  ],
                                ),
                              ),
                            ),
                            replacement: const LoadingDialog(
                              elevation: 0,
                              message: 'Đang tìm Deal hot...',
                            ),
                          );
                        }
                    ),
                    ListTile(
                      dense: true,
                      title: const Text(
                        "KHUYẾN MÃI CHO BẠN",
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      tileColor: Colors.transparent,
                      trailing: const Text(
                        "Xem thêm >",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: UIColors.brandA),
                      ),
                      onTap: () {
                        // Get.to(const FlashSalePage());
                      },
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 16, right: 16,),
                    //   child: Obx(() {
                    //     return Visibility(
                    //       visible: null != viewModel.promotionProgramPresponse.value?.data,
                    //       replacement: const LoadingDialog(
                    //         insetPadding: EdgeInsets.zero,
                    //         elevation: 0,
                    //         message: '',
                    //       ),
                    //       child: Container(
                    //         padding: const EdgeInsets.only(bottom: 16),
                    //         child: SizedBox(
                    //           height: 265,
                    //           child: ListView.separated(
                    //             scrollDirection: Axis.horizontal,
                    //             itemCount: viewModel.promotionProgramPresponse.value.length ?? 0,
                    //             separatorBuilder: (BuildContext context, int index) =>
                    //             const SizedBox(
                    //               width: SpaceValues.space16,
                    //             ),
                    //             itemBuilder: (context, index) => InkWell(
                    //               onTap: () {
                    //                 Get.to(SplashSaleDetails(
                    //                   data: viewModel.promotionProgramPresponse.value!.data![index],
                    //                 ));
                    //               },
                    //               child: SizedBox(
                    //                 height: double.infinity,
                    //                 width: 155,
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.symmetric(
                    //                       vertical: SpaceValues.space4),
                    //                   child: Column(
                    //                     children: [
                    //                       AspectRatio(
                    //                         aspectRatio: 4 / 3,
                    //                         child: ClipRRect(
                    //                           borderRadius:
                    //                           const BorderRadius.only(
                    //                             topLeft: Radius.circular(8),
                    //                             topRight: Radius.circular(8),
                    //                           ),
                    //                           child: GlobalImage(
                    //                               viewModel
                    //                                   .promotionProgramPresponse
                    //                                   .value
                    //                                   [index]
                    //                                   .thumbnail,
                    //                               fit: BoxFit.cover),
                    //                         ),
                    //                       ),
                    //                       Expanded(
                    //                         child: Container(
                    //                           decoration: const BoxDecoration(
                    //                             borderRadius: BorderRadius.only(
                    //                               bottomLeft: Radius.circular(8),
                    //                               bottomRight: Radius.circular(8),
                    //                             ),
                    //                             color: UIColors.white,
                    //                             boxShadow: <BoxShadow>[
                    //                               BoxShadow(
                    //                                 color: Colors.black12,
                    //                                 blurRadius: 5,
                    //                                 offset: Offset(0.0, 0),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Column(
                    //                             crossAxisAlignment:
                    //                             CrossAxisAlignment.start,
                    //                             children: [
                    //                               Container(
                    //                                 // constraints: BoxConstraints(maxHeight: 46),
                    //                                 height: 48,
                    //                                 padding: const EdgeInsets
                    //                                     .only(
                    //                                     left: SpaceValues.space8,
                    //                                     top: SpaceValues.space8,
                    //                                     right:
                    //                                     SpaceValues.space8),
                    //                                 child: Text(
                    //                                   '${viewModel.promotionProgramPresponse.value[index].name} ',
                    //                                   style: Theme.of(context)
                    //                                       .textTheme
                    //                                       .headline5,
                    //                                   overflow:
                    //                                   TextOverflow.ellipsis,
                    //                                   maxLines: 2,
                    //                                 ),
                    //                               ),
                    //                               Expanded(
                    //                                 child: Padding(
                    //                                   padding: const EdgeInsets
                    //                                       .symmetric(
                    //                                       horizontal:
                    //                                       SpaceValues.space8),
                    //                                   child: Text(
                    //                                     viewModel
                    //                                         .promotionProgramPresponse
                    //                                         .value
                    //                                         [index]
                    //                                         .shortDescription ??
                    //                                         '(Không có mô tả)',
                    //                                     style: Theme.of(context)
                    //                                         .textTheme
                    //                                         .subtitle1,
                    //                                     overflow:
                    //                                     TextOverflow.ellipsis,
                    //                                     maxLines: 3,
                    //                                   ),
                    //                                 ),
                    //                                 // WebViewPlus(
                    //                                 //   onWebViewCreated: (controller) => controller.loadString(Util.htlmWrapper(
                    //                                 //     viewModel.promotionProgramPresponse.value[index].description ?? 'Không có mô tả...',
                    //                                 //   )),
                    //                                 //   zoomEnabled: false,
                    //                                 // ),
                    //                               ),
                    //                               Padding(
                    //                                 padding:
                    //                                 const EdgeInsets.all(8.0),
                    //                                 child: Row(
                    //                                   children: [
                    //                                     SvgPicture.asset(
                    //                                         SvgImageAssets
                    //                                             .imgDate),
                    //                                     const SizedBox(
                    //                                       width: SpaceValues.space4,
                    //                                     ),
                    //                                     Expanded(
                    //                                       child: Text(
                    //                                         (viewModel.promotionProgramPresponse.value[index].createdAt?? "").replaceAll("-", "/") ,
                    //                                         maxLines: 1,
                    //                                         overflow: TextOverflow.ellipsis,
                    //                                         textAlign: TextAlign.left,
                    //                                       ),
                    //
                    //                                     ),
                    //                                     // Text(
                    //                                     //     '${viewModel.promotionProgramPresponse.value[index].endDate}'),
                    //                                   ],
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   }),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: SpaceValues.space6),
                color: UIColors.white,
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "SẢN PHẨM MỚI",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      tileColor: Colors.transparent,
                      trailing: const Text(
                        "Xem thêm >",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: UIColors.brandA),
                      ),
                      onTap: () {
                        Get.to(ListProductNew(categoryId:viewModel.dataProductNew.first.subCategory?.category?.id ?? 1 ,title: "Sản phẩm mới",));
                      },
                    ),
                    Obx(
                       ()=>    ConstrainedBox(
                         constraints: const BoxConstraints(maxHeight: 256),
                         child: ListView.separated(
                           padding: const EdgeInsets.symmetric(horizontal: 12),
                           scrollDirection: Axis.horizontal,
                           itemCount: viewModel.dataProductNew.value.length,
                           separatorBuilder: (context, index) =>
                           const SizedBox(width: 8),
                           itemBuilder: (context, index) {
                             return ProductWidget(
                               productId:  viewModel.dataProductNew[index].id!,
                               title: viewModel.dataProductNew[index].name ?? '',
                               avatar: BaseApi.baseUrl+'/img/shop/products/${viewModel.dataProductNew[index].img}',
                               price: viewModel.dataProductNew[index].price!,
                               quantity: viewModel.dataProductNew[index].quantity!,
                             );
                           },
                         ),
                       ),),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomePageModel createViewModel() => getIt<HomePageModel>();
}
