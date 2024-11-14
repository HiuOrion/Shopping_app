import 'package:flutter/material.dart';
import 'package:shopping_app/view/home/widgets/category_card.dart';

import '../../../models/category.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;

  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return Container(
      width: double.infinity,
      height: 105,
      padding: EdgeInsets.only(right: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: media.width * 0.03,),
        reverse: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return Container(
              width: 230, child: CategoryCard(category: categories[index]));
        },
      ),
    );
  }
}
