import 'package:cached_network_image/cached_network_image.dart';
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
    final media = MediaQuery.sizeOf(context);

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
                Expanded(
                  flex: 1,
                  child: Container(
                      width: 84,
                      child: CachedNetworkImage(
                        imageUrl: category.image,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )),
                ),
                SizedBox(
                  width: media.width * 0.03,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    category.name,
                    style: paragraph,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
