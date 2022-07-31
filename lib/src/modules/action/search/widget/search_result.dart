import 'package:deskover_develop/src/config/assets/icon_assets.dart';
import 'package:deskover_develop/src/config/base_api.dart';
import 'package:deskover_develop/src/config/injection_config.dart';
import 'package:deskover_develop/src/modules/action/search/search_model.dart';
import 'package:deskover_develop/src/modules/product_widget/product_widget.dart';
import 'package:deskover_develop/src/themes/space_values.dart';
import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:deskover_develop/src/utils/widgets/view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SearchResultWidget extends StatefulWidget {
  SearchResultWidget({Key? key}) : super(key: key);

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState
    extends ViewWidget<SearchResultWidget, SearchModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SpaceValues.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: SpaceValues.space16),
          Obx(
                () => Wrap(
              spacing: SpaceValues.space8,
              children: [
                for (int i = 0; i < viewModel.listCaterory.length; i++)
                  if (viewModel.listCateroryFilter[i])
                    Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomLeft,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(right: 12, bottom: 12),
                            child: Chip(
                              label: Text(
                                  viewModel.listCaterory[i].name.toString(),
                                  style: const TextStyle(
                                      color: UIColors.white, fontSize: 12)),
                              backgroundColor: UIColors.title70,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: SpaceValues.space4,
                            child: InkWell(
                              onTap: () =>
                              {viewModel.listCateroryFilter[i] = false},
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: UIColors.white,
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  IconAssets.navigationClose,
                                  height: 18,
                                ),
                              ),
                            ),
                          ),
                        ]),
              ],
            ),
          ),
          const SizedBox(height: SpaceValues.space12),
           Text("Kết quả tìm được: ${viewModel.listProduct.length}",
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: SpaceValues.space24),
          Obx(
                () => GridView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemCount: viewModel.listProduct.length,
              itemBuilder: (builder, index) {
                return ProductWidget(
                  productId: viewModel.listProduct[index].id!,
                  title: viewModel.listProduct[index].name ?? '',
                  // priceOrigin: (viewModel.listProduct[index].special_formatted ?? '').isNotEmpty ? viewModel.listProduct[index].original_price_formatted : '',
                  // promotion: viewModel.listProduct[index].special_percentage_formatted ?? '',
                  // price: viewModel.listProduct[index].special_formatted ?? viewModel.listProduct[index].original_price_formatted ?? '',
                  avatar: BaseApi.baseUrl_product+'${viewModel.listProduct[index].img}',
                  // isCanBuy: '${viewModel.listProduct[index].qty ?? '0'}' != '0',
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  SearchModel createViewModel() => getIt<SearchModel>();
}
