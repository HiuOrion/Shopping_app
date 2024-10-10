import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

import '../../../styles/font.dart';
import '../../../styles/theme/app_theme.dart';

class MainHeaderProduct extends StatelessWidget {
  const MainHeaderProduct({super.key});


  Widget build(BuildContext context) {

    final _textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 15, left: 15, bottom: 5),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 30,
            width: double.infinity,
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              height: 50,
            ),
          ),
          const SizedBox(height: 10), // Thêm khoảng cách giữa các phần

          // Tìm kiếm và giỏ hàng
          Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  autofocus: false,
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm...",
                    hintStyle: paragraph,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                ),
              ),
              const SizedBox(width: 10),

              // Badge giỏ hàng
              Expanded(
                flex: 1,
                child: badges.Badge(
                  badgeContent: const Text(
                    '2',
                    style: TextStyle(color: Colors.white),
                  ),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: AppTheme.lightPrimaryColor,
                  ),
                  onTap: () {},
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.add_shopping_cart),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
