import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controller/product_controller.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/view/product/widget/product_grid.dart';
import 'package:shopping_app/view/product/widget/product_loading_grid.dart';
import 'package:badges/badges.dart' as badges;
import '../../models/product.dart';
import '../../styles/font.dart';
import '../../styles/theme/app_theme.dart';

class ProductScreen extends StatefulWidget {
  final String title;

  const ProductScreen({super.key, this.title = ""});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController textController = TextEditingController();
  List<Product> listFindCategory = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listFindCategory;
    textController;
  }

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return Material(
      child: SafeArea(
        child: Obx(() {
          return Scaffold(
              appBar: AppBar(

                centerTitle: true,
                backgroundColor: Colors.white,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                title: TextField(
                  autofocus: false,
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm...",
                    hintStyle: kFontParagraph,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      productController.findProductByCategory(value);
                      listFindCategory =
                          productController.productListFindCategory;
                    });
                  },
                ),
                actions: [
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoute.cart);
                    },
                    child:
                    badges.Badge(

                      // badgeContent: const Text(
                      //   '2',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: AppTheme.lightPrimaryColor,
                      ),
                      onTap: () {
                      },
                      badgeAnimation: const badges.BadgeAnimation.slide(),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Icons.add_shopping_cart),
                      ),
                    ),
                  ),
                ],
              ),
              body: listFindCategory.isEmpty
                  ? productController.productList.isNotEmpty
                      ? ProductGrid(
                          products: productController.productList,
                          title: productController.nameCategory.value)
                      : ProductLoadingGrid()
                  : ProductGrid(
                      products: listFindCategory,
                      title: productController.nameCategory.value));
        }),
      ),
    );
  }
}
