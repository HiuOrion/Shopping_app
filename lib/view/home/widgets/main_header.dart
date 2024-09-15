import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges; // Thêm import cho badges package
import 'package:shopping_app/styles/font.dart';
import 'package:shopping_app/styles/theme/app_theme.dart';
import 'package:get/get.dart';

class MainHeader extends StatefulWidget {
  const MainHeader({super.key});

  @override
  State<MainHeader> createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, right: 15, left: 15, bottom: 15),
      child: Column(
        children: [
          // Logo
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios_new)),
              // Ô tìm kiếm
              Expanded(
                child: TextField(
                  autofocus: false,
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm...",
                    hintStyle: paragraph,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                  ),
                  onChanged: (value) {},
                  onSubmitted: (value){},
                ),
              ),
              const SizedBox(width: 10),

              // Badge giỏ hàng
              badges.Badge(
                badgeContent: Text('2', style: TextStyle(color: Colors.white)),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: AppTheme.lightPrimaryColor
                ),
                onTap: (){},
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
            ],
          ),
        ],
      ),
    );
  }
}
