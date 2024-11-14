import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/styles/font.dart';

class AccountCard extends StatelessWidget {
  const AccountCard(
      {super.key,
      required this.titleAccount,
      required this.icon,
      required this.expand});

  final String titleAccount;
  final String icon;
  final VoidCallback expand;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: InkWell(
              onTap: expand,
              child: Row(
                children: [
                  Container(
                    width: media.width * 0.1,
                    child: SvgPicture.asset(
                      icon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      titleAccount,
                      style: kFontTitle(fontSize: 18),
                    ),
                  ),
                  Icon(Icons.expand_more_sharp),
                ],
              ),
            ),
          ),
          Divider(color: Colors.grey.shade300, height: 2),
        ],
      ),
    );
  }
}
