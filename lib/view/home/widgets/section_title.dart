import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/font.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: header,
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(AppRoute.exploreCategory);
            },
            child: Text("Xem thêm",
                style: secondaryLabel(
                    fontSize: 16, color: Color.fromARGB(255, 83, 177, 117))),
          )
        ],
      ),
    );
  }
}
