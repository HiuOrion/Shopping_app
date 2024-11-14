import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/common/base_button.dart';
import 'package:shopping_app/controller/account_controller.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/view/account/widgets/account_card.dart';
import 'package:shopping_app/view/account/widgets/google_map.dart';
import 'package:shopping_app/view/account/widgets/main_header.dart';

import '../../styles/button.dart';
import '../../styles/font.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController? accountController = Get.find<AccountController>();
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Obx(() {
              if (accountController?.account.value == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    MainHeaderAccount(account: accountController!.account.value!),
                    Divider(color: Colors.grey.shade300, height: 2),
                    AccountCard(
                        titleAccount: "Đơn hàng",
                        icon: 'assets/images/order_icon.svg',
                        expand : () {}),
                    AccountCard(
                        titleAccount: "Thông tin cá nhân",
                        icon: 'assets/images/my_information_icon.svg',
                        expand: () {}),
                    AccountCard(
                        titleAccount: "Địa chỉ giao hàng",
                        icon: 'assets/images/delivery_address.svg',
                        expand: () {
                          Get.toNamed(AppRoute.address);
                        }),
                    AccountCard(
                        titleAccount: "Địa chỉ cửa hàng",
                        icon: 'assets/images/delivery_address.svg',
                        expand: () {
                          Get.to(() => GoogleMapAddressScreen());
                        }),
                    AccountCard(
                        titleAccount: "Thông báo",
                        icon: 'assets/images/notification_icon.svg',
                        expand: () {}),
                    AccountCard(
                        titleAccount: "Về chúng tôi",
                        icon: 'assets/images/about_icon.svg',
                        expand: () {}),
                    SizedBox(height: media.height * 0.04,),
                    BaseButton(title: "Đăng xuất", onPressed: accountController.logout,)
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
