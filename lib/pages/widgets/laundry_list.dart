// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/laundry_choices.dart';
import 'package:golaundry/theme.dart';

class LaundryList extends StatelessWidget {
  final String title;
  // final String sub;
  LaundryList({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          top: 11,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffB1D0E0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/fotolaundry.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: laundryListFieldTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Operation hours: ",
                      style: laundryListSubFieldTextStyle,
                    )
                  ],
                ),
              )
            ],
          ),
          height: 90,
        ),
      ),
    );
  }
}
