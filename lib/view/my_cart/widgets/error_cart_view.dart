import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/styles/font.dart';

import '../../../route/app_route.dart';
import '../../../styles/button.dart';

class ErrorCartView extends StatelessWidget {
  const ErrorCartView ({super.key});

  @override
  Widget build(BuildContext context) {
    
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: media.width * 0.03, vertical: media.height * 0.05),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset('assets/images/image_error.png'),
                SizedBox(height: media.height * 0.05,),
                Text('Lỗi đặt đơn hàng!', style: kFontTitle(fontSize: 28),),
                SizedBox(height: media.height * 0.01,),
                Text("Xin vui lòng thử lại!", style: kFontSubTitle(fontSize: 19)),
                SizedBox(height: media.height * 0.08,),
                Container(
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Thử lại',
                        style: kFontTextButton,
                      ),
                      style: buttonPrimary,
                    )),
                SizedBox(height:  media.height * 0.02,),
                TextButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoute.dashBoard);
                    },
                    child: Text('Quay lại trang chủ', style: kFontTitle(fontSize: 19),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
