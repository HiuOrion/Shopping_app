import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/font.dart';

import '../../../styles/button.dart';

class OrderAcceptView extends StatelessWidget {
  const OrderAcceptView({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: media.height * 0.08,),
                  SvgPicture.asset(
                    'assets/images/order_accept_icon.svg',
                    width: media.width * 0.6,
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: media.height * 0.06,),
                  Text(
                    "Đơn hàng đã được\n chấp thuận",
                    style: kStyleTitle(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  Text(
                    'Hàng hoá của bạn đã được đặt \n và sẽ xử lý nhanh chóng',
                    style: subtitle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: media.height * 0.18,
                  ),
                  Container(
                      height: 67,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Theo dõi đơn hàng',
                          style: textButton,
                        ),
                        style: buttonPrimary,
                      )),
                  SizedBox(
                    height: media.height * 0.01,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoute.dashBoard);
                      },
                      child: Text('Quay lại trang chủ', style: kStyleTitle(fontSize: 19),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
