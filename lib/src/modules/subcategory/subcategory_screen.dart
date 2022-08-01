import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_image.dart';
import 'package:deskover_develop/src/modules/homepage/widgets/list_product_new.dart';
import 'package:deskover_develop/src/modules/product_widget/product_widget.dart';
import 'package:deskover_develop/src/modules/subcategory/subcategory_model.dart';
import 'package:deskover_develop/src/themes/dialogs/loading_dialog.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SubCategoryScreen extends StatefulWidget{
  final int categoryId;
  final String title;
  const SubCategoryScreen({Key? key,required this.categoryId, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState()=> _SubCategoryScreen();

}
class _SubCategoryScreen extends ViewWidget<SubCategoryScreen, SubCategoryModel>{
  @override
  void initState() {
    super.initState();
      viewModel.categoryId.value = widget.categoryId;
      viewModel.loadByCategory();
      viewModel.loadSubCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.white,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 6),
          child: Column(
            children: [
              // AspectRatio(
              //   aspectRatio: 16 / 7,
              //   child: ImageSlideshow(
              //       width: double.infinity,
              //       initialPage: 0,
              //       indicatorColor: UIColors.brandA,
              //       indicatorBackgroundColor: Colors.grey,
              //       onPageChanged: (value) {
              //         //debugPrint('Page changed: $value');
              //       },
              //       autoPlayInterval: 3000,
              //       isLoop: true,
              //       children: const [
              //         GlobalImage(
              //           'https://lh3.googleusercontent.com/cdnMLTetZOOkCWEN83BekbmqHlzSqJp3NZrhVFn3OBQT7e8urrMHjlRWrZ-EadW6k3JK48wKJYLK9k8ZV-fRG7kztC12oZ1XuA=rw-w1920',
              //           fit: BoxFit.fill,
              //         )
              //       ]),
              // ),
              Container(
                color: UIColors.white,
                child: Column(
                  children: [
                    Obx(
                          ()=> Visibility(
                        visible: viewModel.dataSubCategory.value.length > 0,
                        child: SizedBox(
                          height: (viewModel.dataSubCategory.value.length) > 8
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
                                itemCount: viewModel.dataSubCategory.value.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: (viewModel.dataSubCategory.value.length) > 8
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
                                    onPressed: () async
                                    => await viewModel.loadProductBySubId(viewModel.dataSubCategory[i].id!),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(999),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            color: UIColors.black10,
                                            child:  GlobalImage(
                                              BaseApi.baseUrl+'/img/shop/categories/${viewModel.dataSubCategory[i].img}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 31,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 3),
                                            child: Text(
                                              viewModel.dataSubCategory.value[i].name ?? '',
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
                      ),),

                  ],
                ),
              ),
              Container(
                color: UIColors.white,
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.only(top: 16),
                child: Obx(
                      ()=>    Visibility(
                        visible: viewModel.dataProductByCategory.value.length > 0 ,
                        child: Column(
                          children: [
                            GridView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 6,
                                crossAxisSpacing: 2,
                                crossAxisCount: 2,
                                mainAxisExtent: 270,
                                // childAspectRatio: 0.4,
                              ),
                              itemCount: viewModel.dataProductByCategory.value.length,
                              itemBuilder: (context, index) {
                                return ProductWidget(
                                  productId:  viewModel.dataProductByCategory[index].id!,
                                  title: viewModel.dataProductByCategory[index].name ?? '',
                                  avatar: BaseApi.baseUrl+'/img/shop/products/${viewModel.dataProductByCategory[index].img}',
                                  price: viewModel.dataProductByCategory[index].price!,
                                  quantity: viewModel.dataProductByCategory[index].quantity!,
                                );
                              },
                            ),
                            SizedBox(
                              height: 30,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    elevation: 0.0,
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed:() async{

                                  },
                                  child: Text(
                                    'Xem thêm....',
                                    style: TextStyle(
                                        color: UIColors.brandA
                                    ),
                                  )),
                            )
                          ],
                        ),
                        replacement: const Center(
                          child: LoadingDialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            message: 'Danh mục trống...',
                          ),
                        ),
                      ),),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  SubCategoryModel createViewModel() => getIt<SubCategoryModel>();



}
