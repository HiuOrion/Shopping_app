import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/view/product/widget/product_card.dart';
import '../../../models/product.dart';
import '../../../route/app_route.dart';
import '../../../styles/font.dart';

class ProductGrid extends StatefulWidget {
  final List<Product> products;
  final String title;

  const ProductGrid({super.key, required this.products, required this.title});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: media.height * 0.01),
          height: media.height * 0.05,
          child: Text(
            widget.title,
            style: kFontTitle(fontSize: 24),
          ),
        ),
        Container(
          height: media.height * 0.7,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final product = widget.products[index];

              return InkWell(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.toNamed(AppRoute.productDetail, arguments: product.id);
                },
                child: ProductCard(product: product),
              );
            },
          ),
        ),
      ],
    );
  }
}
