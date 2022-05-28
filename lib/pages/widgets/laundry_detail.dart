import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class LaundryDetail extends StatelessWidget {
  final String laundry_name;
  final String laundry_address;
  LaundryDetail({required this.laundry_name, required this.laundry_address});
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
            "Operation Hour: ",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Phone Number: ",
            style: laundryPageSubHeadingFieldTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Fare per 1 KM: ",
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
            "Laundry 1 is a laundry service where you can send your laundry for laundry. This laundry service is good for your laundry if you dont know where to laundry your laundry.",
            textAlign: TextAlign.justify,
            style: laundryPageBodyFieldTextStyle,
          ),
        ],
      ),
    );
  }
}
