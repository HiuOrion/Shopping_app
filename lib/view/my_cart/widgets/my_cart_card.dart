import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/models/product_detail.dart';
import 'package:shopping_app/styles/font.dart';

class MyCartCard extends StatelessWidget {
  final ProductDetail product;
  final VoidCallback didDelete;
  final VoidCallback didQuantityAdd;
  final VoidCallback didQuantitytySub;

  const MyCartCard({
    super.key,
    required this.product,
    required this.didQuantityAdd,
    required this.didQuantitytySub,
    required this.didDelete,
  });

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: product.image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: media.width * 0.03),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(product.name,
                          maxLines: null,
                          overflow: TextOverflow.ellipsis,
                          style: kStyleTitle(fontSize: 18)),
                    ),
                    InkWell(
                        onTap: didDelete,
                        child: Icon(Icons.highlight_remove_outlined)),
                  ],
                ),
                Text(product.weight, style: subtitle(fontSize: 14)),
                SizedBox(width: media.width * 0.03),
                Row(
                  children: [
                    InkWell(
                      onTap: didQuantitytySub,
                      child: Container(
                          width:  media.width * 0.1,
                          height: media.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.remove,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(width: media.width * 0.04),
                    Text((product.quantity).toString(),
                        style: subtitle(fontSize: 16)),
                    SizedBox(width: media.width * 0.04),
                    InkWell(
                      onTap: didQuantityAdd,
                      child: Container(
                          width: media.width * 0.1,
                          height: media.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 83, 177, 117),
                          )),
                    ),
                    const Spacer(),
                    Text(
                      "${NumberFormat("#,##0", "vi_VN").format(product.price * product.quantity)} VNĐ",
                      style: kStyleTitle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
