import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/models/category.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/font.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    // print(category.image);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoute.product, arguments: category.id);
        },
        child: Material(
            elevation: 8,
            shadowColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            child: Row(
              children: [
                Container(
                  width: 84,
                  child: Image.network(
                    category.image,
                    errorBuilder: (ctx, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  category.name,
                  style: paragraph,
                )
              ],
            )),
      ),
    );
  }
}
