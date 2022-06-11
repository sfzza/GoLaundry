import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class LaundryDetail extends StatelessWidget {
  final String laundry_name;
  final String laundry_address;
  final String laundry_hour;
  final String laundry_fare;
  final String laundry_phone;
  LaundryDetail(
      {required this.laundry_name,
      required this.laundry_address,
      required this.laundry_fare,
      required this.laundry_hour,
      required this.laundry_phone});
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
            height: 10,
          ),
          Text(
            "Phone Number: $laundry_phone",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Fare per 1 KM: $laundry_fare rupiah",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(height: 30),
          Text(
            "About",
            style: laundryPageHeadingFieldTextStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            textAlign: TextAlign.justify,
            style: laundryPageBodyFieldTextStyle,
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
