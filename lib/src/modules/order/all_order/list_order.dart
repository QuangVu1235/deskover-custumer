import 'package:deskover_develop/src/themes/ui_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=> _ListOrder();

}

class _ListOrder extends State<ListOrder> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: UIColors.white,
          title: const Text('Quản lý đơn hàng'),
        ),
        body:  Column(
          children: const [
            TabBar(
              isScrollable: true,
              unselectedLabelStyle: TextStyle(
                  fontSize: 13
              ),
              tabs: <Widget>[
                Tab(
                  text: 'Tất cả',
                ),
                Tab(
                  text: 'Chờ xác nhận',
                ),
                Tab(
                  text: 'Đang giao',
                ),
                Tab(
                  text: 'Đã giao',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.down,
                children: <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
