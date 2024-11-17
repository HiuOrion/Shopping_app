import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopping_app/models/top_product.dart';

import '../../../styles/font.dart';

class TopProductCard extends StatelessWidget {
  final TopProduct topProduct;

  const TopProductCard({super.key, required this.topProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          border: Border.all(color: Colors.grey.shade400, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Hero(
                tag: topProduct.id,
                child: CachedNetworkImage(
                  imageUrl: topProduct.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey.shade300,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.grey.shade300,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  topProduct.name,
                  style: kFontTitle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  topProduct.weight,
                  style: kFontSubTitle(fontSize: 14),
                ),
                Text(
                  "Số lượng bán ra: ${topProduct.totalQuantity}",
                  style: kFontSubTitle(fontSize: 14),
                  maxLines: 2,
                  softWrap: true,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${NumberFormat("#,##0", "vi_VN").format(topProduct.price)} VNĐ",
                  style: kFontTitle(fontSize: 18),
                ),
                // Container(
                //   width: 45,
                //   height: 45,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(17),
                //       color: const Color.fromARGB(255, 83, 177, 117)),
                //   child: IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.add,
                //         color: Colors.white,
                //       )),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
