import 'package:flutter/material.dart';
import 'package:shopping_app/view/home/widgets/carousel_slider.dart';
import 'package:shopping_app/view/home/widgets/main_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        MainHeader(),
        CarouselLoading(),
      ],
    ));
  }
}
