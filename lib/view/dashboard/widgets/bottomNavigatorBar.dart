import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/controller/dashboard_controller.dart';
import 'package:shopping_app/styles/theme/app_theme.dart';

class BottomNavigatorBar extends StatelessWidget {
  const BottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();

    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.white,
              width: 0.7,
            ),
          ),
        ),
        child: SnakeNavigationBar.color(
          height: 70,
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.circle,
          snakeViewColor: AppTheme.lightPrimaryColor, // màu của hiệu ứng
          selectedLabelStyle: GoogleFonts.robotoSlab(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 83, 177, 117),
          ),
          unselectedLabelStyle: GoogleFonts.robotoSlab(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: controller.tabIndex.value,
          onTap: (value) {
            controller.updateIndex(value);
          },
          items:  [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/logo_home.svg'), label: "Cửa hàng"),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: 'Giỏ hàng'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp), label: 'Yêu thích'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Tài khoản"),
          ],
        ),
      );
    });
  }
}
