import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Flexible(
             flex: 1,
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
            SizedBox(width: 5,),

            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favoriteProduct.name,
                    style: title(fontSize: 20),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    favoriteProduct.weight,
                    style: subtitle(fontSize: 18),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    favoriteProduct.price.toString(),
                    style: price(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.productDetail,
                            arguments: favoriteProduct.productId.toString());
                      },
                      icon: Icon(Icons.expand_more_sharp))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
