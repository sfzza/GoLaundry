// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/view_laundry_service_page.dart';
import 'package:golaundry/theme.dart';

class laundryChoices extends StatelessWidget {
  final String imageUrl;
  final String text;

  laundryChoices({required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const viewLaundryServicePage()),
        );
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
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
      ),
    );
  }
}
