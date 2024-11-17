import 'package:flutter/material.dart';
import 'package:shopping_app/view/explore/widgets/explore_card.dart';

import '../../../models/category.dart';

class ExploreGrid extends StatefulWidget {
  const ExploreGrid({super.key, required this.categories});
  final List<Category> categories;

  @override
  State<ExploreGrid> createState() => _ExploreGridState();
}

class _ExploreGridState extends State<ExploreGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1),
          itemCount: widget.categories.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final category = widget.categories[index];

            return ExploreCard(category: category);
          }
          ),
    );
  }
}
