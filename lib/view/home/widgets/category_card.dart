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

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.product, arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            border: Border.all(color: Colors.grey.shade400, width: 1)),
        child: Row(
          children: [
            SizedBox(
              width: media.width * 0.3,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: category.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),

            SizedBox(
              width: media.width * 0.03,
            ),
            Text(
              category.name,
              style: kFontPrimaryLabel,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              maxLines: 3,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
