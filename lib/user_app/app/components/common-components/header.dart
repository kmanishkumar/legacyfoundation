import 'package:flutter/material.dart';

Widget headerView(
  BuildContext context,
) {
  return new AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          height: 40,
        )
      ],
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.account_circle, color: Colors.white)),
      IconButton(
          onPressed: () {},
          icon: Icon(Icons.card_giftcard, color: Colors.white)),
    ],
  );
}
