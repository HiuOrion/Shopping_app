import 'package:flutter/material.dart';
import 'package:shopping_app/view/explore/widgets/explore_loading_card.dart';

class ExploreLoading extends StatelessWidget {
  const ExploreLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemCount: 6,
        itemBuilder: (context, index) => ExploreLoadingCard());
  }
}
