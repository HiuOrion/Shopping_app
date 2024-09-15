import 'package:flutter/material.dart';
import 'package:shopping_app/styles/font.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: header,
          ),
          const Text(
            "Xem thêm",
            style: TextStyle(color: Color.fromARGB(255, 80, 177, 114)),
          ),
        ],
      ),
    );
  }
}
