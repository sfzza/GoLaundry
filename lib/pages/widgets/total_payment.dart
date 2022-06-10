import 'package:flutter/material.dart';

import '../../theme.dart';

class TotalPayment extends StatefulWidget {
  // const TotalPayment({Key? key}) : super(key: key);

  @override
  State<TotalPayment> createState() => _TotalPaymentState();
  final String total;
  TotalPayment({required this.total});
}

class _TotalPaymentState extends State<TotalPayment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: Color(0xff406882)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              "Total", style: totalFieldTextStyle,
              // style: totalFieldTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              "RP ${widget.total}", style: totalSubFieldTextStyle,
              // style: totalSubFieldTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
