// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../theme.dart';

class HistoryAdminCard extends StatefulWidget {
  const HistoryAdminCard({Key? key}) : super(key: key);

  @override
  State<HistoryAdminCard> createState() => _HistoryAdminCardState();
}

class _HistoryAdminCardState extends State<HistoryAdminCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color(0xffB1D0E0),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "[Rejected]",
                style: bookingStatusTextStyle,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 7),
                child: const Divider(
                  height: 1,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Color(0xff406882),
                ),
              ),
              Text(
                "nurulizza.safira@gmail.com",
                style: bookingEmailTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "jalan banyuwangi nomor 56 blok A Waru Sidoarjo Jawa Timur Indonesia",
                style: bookingAddressTextStyle,
                maxLines: 2,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Total: ",
                    style: bookingTotalTextStyle,
                  ),
                  Text(
                    "RP 7000",
                    style: bookingEmailTextStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}