// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class LaundryList extends StatefulWidget {
  final String laundry_name;
  final String laundry_hour;
  final String distance;
  LaundryList(
      {required this.laundry_name,
      required this.laundry_hour,
      required this.distance});

  @override
  State<LaundryList> createState() => _LaundryListState();
}

class _LaundryListState extends State<LaundryList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    widget.laundry_name,
                    style: laundryListFieldTextStyle,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Operation hours:",
                        style: laundryListSubFieldTextStyle,
                      ),
                      Text(
                        widget.laundry_hour,
                        style: laundryListSubFieldTextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Text(widget.distance),
            )
          ],
        ),
        height: 90,
      ),
    );
  }
}
