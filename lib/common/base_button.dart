
import 'package:flutter/material.dart';

import '../styles/button.dart';
import '../styles/font.dart';

class BaseButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const BaseButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return Container(
        height: media.height * 0.08,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: kFontTextButton,
          ),
          style: buttonPrimary,
        ));
  }
}
