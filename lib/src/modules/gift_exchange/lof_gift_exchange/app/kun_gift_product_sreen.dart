import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/assets/image_asset.dart';
import '../../product_widget.dart';

class LofGiftProductExchangeScreen extends StatefulWidget {
  const LofGiftProductExchangeScreen({Key? key}) : super(key: key);

  @override
  State<LofGiftProductExchangeScreen> createState() => _LofGiftProductExchangeScreenState();
}

class _LofGiftProductExchangeScreenState extends State<LofGiftProductExchangeScreen> {

  final List<String> entries = <String>['A', 'B', 'C','d'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('DANH SÁCH QUÀ TẶNG CHƯƠNG TRÌNH',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue
                  ),
                ),
              ),
              SizedBox(
                // margin: const EdgeInsets.only(left: 5),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    shrinkWrap: true,
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return const ProductWidget(
                        productId: 1,
                        title: 'Binh nước giữa nhiệt Kun(8 QK/ 2 KVĐ)',
                        avatar: ImageAssets.waterKun,
                        qrCode: SvgImageAssets.qrCode,

                      );
                    },
                  )
              ),
            ],
          ),
        ),
        floatingActionButton:
        SizedBox(
          height: 60,
          width: 60,
          child: ElevatedButton(
            onPressed: () {  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(130.0),
              ),
            ),
            child: Column(
              children: [
                Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                SizedBox(height: 2,),
                Text('Giỏ quà',style: TextStyle(fontSize: 9,color: Colors.white),),
              ],
            ),

          ),
        )

    );
  }
}
