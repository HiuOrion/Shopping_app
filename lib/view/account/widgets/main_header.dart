import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_app/models/account.dart';
import 'package:shopping_app/styles/font.dart';

class MainHeaderAccount extends StatelessWidget {
  const MainHeaderAccount({super.key, required this.account});
  final Account account;

  @override
  Widget build(BuildContext context) {

    final media = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [

          //avatar
          ClipRRect(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(35),
          ),
          SizedBox(width: media.width *0.02,),

          //Tên và gmail
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      account.userName,
                      style: kFontTitle(fontSize: 25),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 15,))
                  ],
                ),
                Text(
                  account.email,
                  style: kFontSubTitle(fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
