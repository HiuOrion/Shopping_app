import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

import '../styles/font.dart';
import '../styles/theme/app_theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isShowLeading;
  final bool isShowActions;
  final String? title;

  const CustomAppBar({
    super.key,
    required this.isShowLeading,
    required this.isShowActions,
    this.title,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.isShowLeading
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            )
          : null,
      title: Text(
        widget.title ?? '',
        style: kFontTitle(fontSize: 24),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: widget.isShowActions ? [
        // Badge giỏ hàng
                badges.Badge(
                // badgeContent: const Text(
                //   '2',
                //   style: TextStyle(color: Colors.white),
                // ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: AppTheme.lightPrimaryColor,
                ),
                onTap: () {},
                badgeAnimation: const badges.BadgeAnimation.slide(),
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
        IconButton(onPressed: () {

        }, icon: const Icon(Icons.messenger))

      ] :null,
    );
  }
}
