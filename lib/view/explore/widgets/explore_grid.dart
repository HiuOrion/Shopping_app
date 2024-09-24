import 'package:flutter/material.dart';
import 'package:shopping_app/view/explore/widgets/explore_card.dart';

import '../../../models/category.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return ExploreCard(category: category);
        }
        );
  }
}
