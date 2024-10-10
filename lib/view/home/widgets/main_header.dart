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

    final media = MediaQuery.of(context);
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
              // Ô tìm kiếm
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
