import 'package:deskover_develop/src/modules/profile/profiledetail/profile_detail_screen.dart';
import 'package:deskover_develop/src/modules/profile/support/support_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../themes/ui_colors.dart';
import 'addressbook/addressbook_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     shape: Border(
      //         bottom: BorderSide(color: Colors.grey.shade300, width: 0.5))),
        backgroundColor: UIColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0.0,
                    color: Color(0xffF7F9FA),
                    // color: Colors.grey[200],
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CircleAvatar(

                            radius: 40,
                            backgroundColor: Colors.transparent,
                            child: Image.asset(
                              "resources/images/avt_profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Thông tin cá nhân",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Họ và tên",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Nguyễn Văn A",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Số điện thoại",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "0909012345",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "lephuchau@gmail.com",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Loại tài khoản",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    "Khách hàng",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(ProfileDetailScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: SvgPicture.asset(
                        "resources/images/profilepic.svg",
                        height: 40,
                      ),
                      title: Text(
                        "Thông tin cá nhân",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(AddressBookScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: Image.asset(
                        "resources/images/icon _address book new_.png",
                        height: 40,
                      ),
                      title: Text(
                        "Sổ địa chỉ",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SupportScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: SvgPicture.asset(
                        "resources/images/icon _support _female.svg",
                        height: 40,
                      ),
                      title: Text(
                        "Hỗ trợ",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      tileColor: Color(0xffF7F9FA),
                      leading: SvgPicture.asset(
                        "resources/images/icon_logout.svg",
                        height: 40,
                      ),
                      title: Text(
                        "Đăng xuất",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Version 3.9.11(2020126130)",
                style: TextStyle(
                    fontSize: 10, color: Colors.grey, letterSpacing: 0.5),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Hotline: 1900 10 01 11",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ));
  }
}
