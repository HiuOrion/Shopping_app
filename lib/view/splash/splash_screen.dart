import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/button.dart';
import 'package:shopping_app/styles/font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash_image.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 39,
                height: 65,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SvgPicture.asset('assets/images/ic_logo.svg'),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: Text(
                  "CHÀO MỪNG ĐẾN VỚI",
                  style: headerSplash,
                ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text("CỬA HÀNG CỦA CHÚNG TÔI", style: headerSplash),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoute.logIn);
                },
                child: Text(
                  "Bắt đầu",
                  style: textButton,
                ),
                style: buttonPrimary,
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
