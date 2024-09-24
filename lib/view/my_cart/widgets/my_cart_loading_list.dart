import 'package:flutter/material.dart';
import 'package:shopping_app/view/my_cart/widgets/my_cart_loading_card.dart';

class MyCartLoadingList extends StatelessWidget {
  const MyCartLoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => MyCartLoadingCard(),
        separatorBuilder: (context, index) => Divider(
              color: Colors.black26,
              height: 1,
            ),
        itemCount: 3);
  }
}
