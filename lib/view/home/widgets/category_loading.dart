import 'package:flutter/material.dart';
import 'package:shopping_app/view/home/widgets/category_loading_card.dart';

class CategoryLoading extends StatelessWidget {
  const CategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,

          //Kéo đêến cuối sẽ tự nảy về đầu
          physics: BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const CategoryLoadingCard()),
    );
  }
}
