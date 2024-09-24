import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/models/product_detail.dart';
import 'package:shopping_app/styles/font.dart';

class MyCartCard extends StatelessWidget {
  const MyCartCard({super.key, required this.productDetail});

  final ProductDetail productDetail;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CachedNetworkImage(
            imageUrl: productDetail.image,
            placeholder: (context, url) {
              return Shimmer.fromColors(
                  child: Container(
                    color: Colors.grey,
                  ),
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white);
            },
            errorWidget: (context, url, error) => Center(
              child: Icon(Icons.error_outline),
            ),
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                productDetail.name,
                style: title(fontSize: 16),
              ),
            ),
            SizedBox(
              height: media.width * 0.01,
            ),
            Expanded(
                flex: 1,
                child: Text(
                  productDetail.weight,
                  style: title(fontSize: 14),
                )),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove,
                      ),
                      color: Colors.grey,
                    ),
                  ),


                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}
