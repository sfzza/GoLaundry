// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/laundries.dart';
import 'package:golaundry/theme.dart';

class popularlaundry extends StatefulWidget {
  final String laundry_name;
  final String laundry_address;
  // Laundries? model;
  // BuildContext? context;
  // final String imageUrl;
  // final String title;
  // final String location;
  // final String duration;

  popularlaundry({required this.laundry_name, required this.laundry_address});

  @override
  State<popularlaundry> createState() => _popularlaundryState();
}

class _popularlaundryState extends State<popularlaundry> {
  // popularlaundry(
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 250,
          height: 260,
          decoration: BoxDecoration(
            color: Color(0xff6998AB),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 234,
                    height: 146,
                    child: FittedBox(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      child: Image.asset(
                        'assets/fotolaundry.png',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, left: 8),
                  child:
                      Text(widget.laundry_name, style: titleLaundryTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 15,
                        color: Color(0xff1A374D),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: Text(
                          widget.laundry_address,
                          style: subtitleLaundryTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 15,
                        color: Color(0xff1A374D),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text("null", style: subtitleLaundryTextStyle),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
