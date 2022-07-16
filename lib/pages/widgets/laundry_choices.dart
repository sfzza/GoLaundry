// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/view_laundry_service_page.dart';
import 'package:golaundry/theme.dart';

class laundryChoices extends StatelessWidget {
  final String imageUrl;
  final String text;

  laundryChoices({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(1, 2),
            blurRadius: 2.0,
          )
        ],
        color: Color(0xff406882),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 3,
            ),
            Text(text, style: choiceTextStyle)
          ],
        ),
      ),
    );
  }
}
