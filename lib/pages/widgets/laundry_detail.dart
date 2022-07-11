// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

import 'laundry_box.dart';
import 'laundry_choices.dart';

class LaundryDetail extends StatelessWidget {
  final String laundry_name;
  final String laundry_address;
  final String laundry_hour;
  final String laundry_fare;
  final String laundry_phone;

  LaundryDetail({
    required this.laundry_name,
    required this.laundry_address,
    required this.laundry_fare,
    required this.laundry_hour,
    required this.laundry_phone,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            laundry_name,
            style: laundryPageTitleFieldTextStyle,
          ),
          SizedBox(
            height: 7,
          ),
          Text(laundry_address,
              overflow: TextOverflow.visible,
              style: laundryPageBodyFieldTextStyle),
          SizedBox(
            height: 17,
          ),
          Text(
            "Operation Hour: $laundry_hour",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Phone Number: $laundry_phone",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Fare per 1 KM: $laundry_fare rupiah",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      laundryBox(
                        imageUrl: 'assets/wash.png',
                        text: 'wash',
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  laundryBox(imageUrl: 'assets/iron.png', text: 'iron'),
                  SizedBox(
                    width: 15,
                  ),
                  laundryBox(
                      imageUrl: 'assets/wash&iron.png', text: 'wash & iron'),
                  SizedBox(
                    width: 15,
                  ),
                  laundryBox(imageUrl: 'assets/dry.png', text: 'dry'),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
