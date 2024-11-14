import 'package:flutter/material.dart';
import 'package:shopping_app/styles/font.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionTitle({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kFontHeader,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text("Xem thêm",
              style: kFontSecondLabel(
                  fontSize: 16,
                  color: Color.fromARGB(255, 83, 177, 117))),
        )

      ],
    );
  }
}
