import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:retrofit/http.dart';

import '../../config/assets/icon_assets.dart';
import '../../config/assets/image_asset.dart';
import '../../themes/space_values.dart';
import '../../themes/ui_colors.dart';
import 'creat_cart.dart';

class ExchangePoints extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExchangePoint();
}

class _ExchangePoint extends State<ExchangePoints> {
  String province = 'Tất cả Tỉnh/Thành Phố';
  var provinces = [
    'Tất cả Tỉnh/Thành Phố',
    'Item 1',
  ];
  String district = 'Tất cả Quận/Huyện';
  var districts = [
    'Tất cả Quận/Huyện',
    'Item 1',
  ];

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UIColors.white,
        margin: const EdgeInsets.only(top: 1),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.44,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        focusColor: UIColors.black10,
                        hintText: "Tất cả Tỉnh/Thành Phố",
                        contentPadding: EdgeInsets.only(left: 5),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: UIColors.black10),
                          borderRadius:
                              BorderRadius.circular(SpaceValues.space8),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            dropdownColor: UIColors.white,
                            isExpanded: false,
                            isDense: false,
                            value: province,
                            items: provinces
                                .map((String items) => DropdownMenuItem(
                                      value: items,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: Text(
                                          items,
                                          style: const TextStyle(
                                              color: UIColors.fontGray,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                province = newValue!;
                              });
                            }),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SpaceValues.space4,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.43,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Tất cả Quận/Huyện",
                        contentPadding: EdgeInsets.only(left: 3),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: UIColors.black10),
                          borderRadius:
                              BorderRadius.circular(SpaceValues.space8),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            isExpanded: false,
                            value: district,
                            items: districts
                                .map((String items) => DropdownMenuItem(
                                      value: items,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          items,
                                          style: const TextStyle(
                                              color: UIColors.fontGray,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                district = newValue!;
                              });
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SpaceValues.space16,
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(14),
                  prefixIconConstraints: const BoxConstraints.expand(
                      height: SpaceValues.space16, width: SpaceValues.space32),
                  border: InputBorder.none,
                  hintText: 'Tìm kiếm sản phẩm quà tặng...',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: UIColors.fontGray),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: UIColors.black10),
                    borderRadius: BorderRadius.circular(SpaceValues.space8),
                  ),
                  suffixIconConstraints: const BoxConstraints(
                      maxHeight: SpaceValues.space24, minWidth: 0),
                  suffixIcon: InkWell(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(IconAssets.search,
                            color: UIColors.fontGray),
                        const SizedBox(
                          width: 14,
                        ),
                        SvgPicture.asset(IconAssets.Filter,
                            color: UIColors.fontGray),
                        const SizedBox(
                          width: SpaceValues.space16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CreateChangePointCart());
                        },
                        child: Card(
                          elevation: 0.0,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(SpaceValues.space6),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: UIColors.black70, width: 1)),
                                  child: Image.asset(ImageAssets.qrCode),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: SpaceValues.space4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tuệ Lan Shop',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: UIColors.darkGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: SpaceValues.space6,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            IconAssets.hardwarePhoneIphone,
                                            color: UIColors.brandB,
                                          ),
                                          const SizedBox(
                                            width: SpaceValues.space8,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              '0912 345 678',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: UIColors.darkGray,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: SpaceValues.space6,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            IconAssets.actionStore,
                                            color: UIColors.brandB,
                                          ),
                                          const SizedBox(
                                            width: SpaceValues.space8,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              '230,Phường Nghĩa Chánh, Thành phố Thủ Đức',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: UIColors.darkGray,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
