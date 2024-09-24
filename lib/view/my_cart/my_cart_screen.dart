import 'package:flutter/material.dart';
import 'package:shopping_app/view/my_cart/widgets/my_cart_loading_list.dart';

import '../../styles/button.dart';
import '../../styles/font.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Giỏ hàng',
          style: title(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          
          Container(
              height: 67,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Thanh toán',
                  style: textButton,
                ),
                style: buttonPrimary,
              ))
        ],
      ),
    );
  }
}
