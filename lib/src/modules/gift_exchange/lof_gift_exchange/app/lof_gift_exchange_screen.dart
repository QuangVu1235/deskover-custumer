import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../config/assets/image_asset.dart';
import '../../../../themes/ui_colors.dart';
import 'kun_gift_product_sreen.dart';

class LofGiftExchangeScreen extends StatefulWidget {
  const LofGiftExchangeScreen({Key? key}) : super(key: key);

  @override
  State<LofGiftExchangeScreen> createState() => _LofGiftExchangeScreenState();
}

class _LofGiftExchangeScreenState extends State<LofGiftExchangeScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: UIColors.white,
      appBar: AppBar(
        title: Text('Đổi quà LOF',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
        backgroundColor: UIColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16/9,
            child: Image.asset(
              ImageAssets.giftexchange,
              width: double.infinity,
            ),),
          Container(
            color: UIColors.white,
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text("Thông tin chương trình", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  ),
                  Tab(
                    child: Text("Danh sách quà tặng", style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
                  ),
                ]),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Text("CÙNG LOF SĂN QUÀ TẾT, KẾT YÊU THƯƠNG",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),),
                            SizedBox(height: 5,),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text('Chương trình không thể bỏ lỡ trong dịp TẾT này, mua 01 thùng sữa khuyến mãi TẾT sẽ 100% nhận ngay 1 bao lì xì trong thùng có chứa thẻ cào quà tặng/ thẻ Quyền Năng Như Ý (TQNNY)/ tiền mặt. Còn chờ gì nữa mà không săn ngay những phần quà siêu hấp dẫn từ KUN.\n'),
                                  Text('1. Tên chương trình khuyến mại: “SĂN QUÀ TẾT, KẾT YÊU THƯƠNG”\n'),
                                  Text("2. Thời gian khuyến mại: từ ngày 15/11/2021 đến ngày 31/03/2022.\n"),
                                  Text("3. Sản phẩm khuyến mại: \n \n Sữa KUN túi 110ml; Nước Trái Cây KUN 110ml; Sữa KUN chai 90ml; Sữa Bắp Non LIF 180ml;(Quy cách đóng thùng: 24 túi/thùng hoặc 36 chai/thùng hoặc 24 hộp /thùng) \n"),
                                  Text("4. Đối tượng hưởng khuyến mại: \n \n Các đối tượng được hưởng khuyến mại phải là công dân Việt Nam và đang cư trú trên lãnh thổ Việt Nam Nhân viên Công ty Cổ phần Sữa Quốc Tế, nhà phân phối, nhân viên nhà phân phối của Công ty Cổ phần Sữa Quốc Tế và các công ty in ấn, quảng cáo, cung cấp vật tư, thiết bị có liên quan chương trình và nhân thân của các đối tượng này không được tham gia chương trình khuyến mại này. \n"),
                                  Text("5. Thể lệ chương trình khuyến mại: \n \n  Khàng mua 01 thùng sữa khuyến mại bất kỳ (chi tiết tại mục 3) sẽ nhận được 01 bao lì xì trong thùng chứa thẻ cào quà tặng/ thẻ Quyền Năng Như Ý/ tiền mặt."),

                                ],
                              ) ,
                            ),

                          ],
                        ),
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LofGiftProductExchangeScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
