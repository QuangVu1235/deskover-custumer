import 'package:deskover_develop/src/config/assets/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../product_widget.dart';

class GiftProductScreen extends StatefulWidget {
  const GiftProductScreen({Key? key}) : super(key: key);

  @override
  State<GiftProductScreen> createState() => _GiftProductScreenState();
}
class _GiftProductScreenState extends State<GiftProductScreen> {

  final List<String> entries = <String>['A', 'B', 'C','d'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        // margin: const EdgeInsets.only(left: 5),
          child: GridView.builder(
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
                avatar: 'ImageAssets.imggiftproduct',
                qrCode: SvgImageAssets.qrCode,
              );
            },
          )
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
      // FloatingActionButton(
      //   isExtended: false,
      //  
      //   onPressed: () { },
      //   backgroundColor: Colors.blue,
      //  child:  Center(
      //    child: Column(
      //      children: [
      //        Icon(
      //          Icons.shopping_cart_outlined,color: Colors.white,
      //        ),
      //        Text("Giỏ hàng",style: TextStyle(
      //            fontSize: 10,
      //            color: Colors.white
      //        ),),
      //      ],
      //    ),
      //  ),
      // ),
    );

  }
}
