import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/gift_exchange/product_widget.dart';
import 'package:deskover_develop/src/modules/homepage/widgets/list_product_new.dart';
import 'package:deskover_develop/src/themes/dialogs/loading_dialog.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      body: SingleChildScrollView(
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
                      'https://lh3.googleusercontent.com/cdnMLTetZOOkCWEN83BekbmqHlzSqJp3NZrhVFn3OBQT7e8urrMHjlRWrZ-EadW6k3JK48wKJYLK9k8ZV-fRG7kztC12oZ1XuA=rw-w1920',
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
                                     // Get.to(ProductListScreen(
                                     //   categoryId:
                                     //   viewModel.listCaterory.value![i].id!.toString(),
                                     //   categoryTitle:
                                     //   viewModel.listCaterory.value![i].name!,
                                     // ));
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
                      Get.to(ListProductNew(viewModel: viewModel,title: "Sản phẩm mới",));
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
    );
  }

  @override
  HomePageModel createViewModel() => getIt<HomePageModel>();
}
