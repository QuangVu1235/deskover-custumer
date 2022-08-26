import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/global_modules/widget/global_image.dart';
import 'package:deskover_develop/src/modules/homepage/widgets/list_product_model.dart';
import 'package:deskover_develop/src/modules/homepage/widgets/product_see_more_model.dart';
import 'package:deskover_develop/src/modules/product_widget/product_widget.dart';
import 'package:deskover_develop/src/modules/subcategory/subcategory_model.dart';
import 'package:deskover_develop/src/themes/dialogs/loading_dialog.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProductSeeMore extends StatefulWidget{
  final String title;
  const ProductSeeMore({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState()=> _ProductSeeMore();

}
class _ProductSeeMore extends ViewWidget<ProductSeeMore, ProductSeeMoreModel>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.white,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 6),
          child: Column(
            children: [
              Container(
                color: UIColors.white,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(top: 6),
                child: Obx(
                      ()=>    Visibility(
                    visible: viewModel.dataProductDiscount.isNotEmpty ,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: viewModel.keySort.value == 'DESC' ? UIColors.brandA: UIColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: UIColors.brandA
                                      ),
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  onPressed: (){
                                    viewModel.keySort.value = 'DESC';
                                    viewModel.loadProductDiscount();
                                  },
                                  child: Text(
                                    'Giảm dần',
                                    style: TextStyle(
                                        color: viewModel.keySort.value == 'DESC' ? UIColors.white : UIColors.brandA
                                    ),
                                  )
                              ),
                              const SizedBox(width: 10,),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: viewModel.keySort.value == 'ASC' ? UIColors.brandA: UIColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: UIColors.brandA
                                      ),
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  onPressed: (){
                                    viewModel.keySort.value = 'ASC';
                                    viewModel.loadProductDiscount();
                                  },
                                  child: Text(
                                    'Tăng dần',
                                    style: TextStyle(
                                        color: viewModel.keySort.value == 'ASC' ? UIColors.white : UIColors.brandA
                                    ),
                                  )
                              ),


                            ],
                          ),
                        ),
                        const SizedBox(height: 6,),
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
                          itemCount: viewModel.dataProductDiscount.length,
                          itemBuilder: (context, index) {
                            return ProductWidget(
                              productId:  viewModel.dataProductDiscount[index].id!,
                              title: viewModel.dataProductDiscount[index].name ?? '',
                              avatar: BaseApi.baseUrl+'/img/shop/products/${viewModel.dataProductDiscount[index].img}',
                              price: viewModel.dataProductDiscount[index].price!,
                              quantity: viewModel.dataProductDiscount[index].quantity!,
                            );
                          },
                        ),
                        SizedBox(
                          height: 40,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                elevation: 0.0,
                                padding: EdgeInsets.zero,
                              ),
                              onPressed:() async{
                                if(viewModel.dataProductDiscount.length < 8){
                                  print('Khong load');
                                }else{
                                  viewModel.size.value = viewModel.size.value + 8;
                                  viewModel.loadProductDiscount();
                                }
                              },
                              child: const Text(
                                'Xem thêm >',
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
  ProductSeeMoreModel createViewModel() => getIt<ProductSeeMoreModel>();



}
