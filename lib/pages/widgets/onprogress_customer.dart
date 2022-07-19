// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../theme.dart';

class OnprogressCustomerCard extends StatefulWidget {
  final String laundry_name;
  final String cust_email;
  final String cust_address;
  final String total;
  final String delivAddress;
  final String payment;
  OnprogressCustomerCard(
      {required this.cust_address,
      required this.cust_email,
      required this.laundry_name,
      required this.total,
      required this.delivAddress,
      required this.payment});

  @override
  State<OnprogressCustomerCard> createState() => _OnprogressCustomerCardState();
}

class _OnprogressCustomerCardState extends State<OnprogressCustomerCard> {
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
              Table(
                columnWidths: {
                  0: FixedColumnWidth(130),
                  // 1: FixedColumnWidth(80)
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Pickup Address:",
                      style: bookingTotalTextStyle,
                    ),
                    Text(
                      widget.cust_address,
                      style: bookingEmailTextStyle,
                      // maxLines: 2,
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Table(
                columnWidths: {
                  0: FixedColumnWidth(130),
                  // 1: FixedColumnWidth(80)
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Delivery Address:",
                      style: bookingTotalTextStyle,
                    ),
                    Text(
                      widget.delivAddress,
                      style: bookingEmailTextStyle,
                      // maxLines: 2,
                    ),
                  ])
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Payment: ",
                    style: bookingTotalTextStyle,
                  ),
                  Text(
                    widget.payment,
                    style: bookingEmailTextStyle,
                  )
                ],
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
