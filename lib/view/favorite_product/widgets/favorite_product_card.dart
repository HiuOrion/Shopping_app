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
      onTap: (){
        Get.toNamed(AppRoute.productDetail,
            arguments: favoriteProduct.productId.toString());
      },
      child: Container(
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
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
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: media.width * 0.04,),

              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoriteProduct.name,
                      overflow: TextOverflow.ellipsis,
                      style: kStyleTitle(fontSize: 20),
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
                flex: 4,
                child: Text(
                  "${NumberFormat("#,##0", "vi_VN").format(favoriteProduct.price)} VNĐ",
                  style: kStyleTitle(fontSize: 18),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.expand_more_sharp)
              )
            ],
          ),
        ),
      ),
    );
  }
}
