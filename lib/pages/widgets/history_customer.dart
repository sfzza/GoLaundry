// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../theme.dart';

class HistoryCustomerCard extends StatefulWidget {
  // const HistoryCustomerCard({Key? key}) : super(key: key);
  final String laundry_name;
  final String cust_email;
  final String cust_address;
  final String total;
  final String statusBook;
  HistoryCustomerCard(
      {required this.cust_address,
      required this.cust_email,
      required this.laundry_name,
      required this.total,
      required this.statusBook});

  @override
  State<HistoryCustomerCard> createState() => _HistoryCustomerCardState();
}

class _HistoryCustomerCardState extends State<HistoryCustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Color(0xffB1D0E0),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                "[${widget.statusBook}]",
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
              Row(
                children: [
                  Text(
                    "Laundry Name: ",
                    style: bookingTotalTextStyle,
                  ),
                  Text(
                    widget.laundry_name,
                    style: bookingEmailTextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.cust_email,
                style: bookingEmailTextStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.cust_address,
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
                    widget.total,
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
