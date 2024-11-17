import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/models/favorite_product.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/font.dart';

class FavoriteProductCard extends StatelessWidget {
  const FavoriteProductCard({super.key, required this.favoriteProduct});

  final FavoriteProduct favoriteProduct;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoute.productDetail,
            arguments: favoriteProduct.productId);
      },
      child: Container(
        height: media.height * 0.15,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: media.width * 0.2,
                child: CachedNetworkImage(
                  imageUrl: favoriteProduct.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey.shade300,
                    child: Container(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: media.width * 0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoriteProduct.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kFontTitle(fontSize: 20),
                  ),
                 const SizedBox(
                    height: 3,
                  ),
                  Text(
                    favoriteProduct.weight,
                    style: kFontSubTitle(fontSize: 18),
                  ),
                ],
              ),
              // SizedBox(
              //   width: media.width * 0.05,
              // ),
              Spacer(),
              Expanded(
                child: Text(
                  "${NumberFormat("#,##0", "vi_VN").format(favoriteProduct.price)} VNĐ",
                  style: kFontTitle(fontSize: 18),
                  // maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
