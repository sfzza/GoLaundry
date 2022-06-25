// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import '../../theme.dart';

class Details extends StatefulWidget {
  // const Details({Key? key, required this.number}) : super(key: key);
  // final String number;

  @override
  State<Details> createState() => _DetailsState();
  final String item;
  final String price;
  // final int? counter;
  final void decrement;
  final void increment;

  Details(
      {required this.item,
      required this.price,
      this.decrement,
      this.increment});
}

class _DetailsState extends State<Details> {
  TextEditingController counterTextEditingController = TextEditingController();
  int counter = 0;
  increment() {
    setState(() {
      counter++;
    });
  }

  decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Color(0xffB1D0E0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item,
                    style: detailTitleFieldTextStyle,
                  ),
                  Text(" : ", style: detailTitleFieldTextStyle),
                  Text("RP ", style: detailSubtitleFieldTextStyle),
                  Text(
                    widget.price,
                    style: detailSubtitleFieldTextStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: NumberInputPrefabbed.roundedButtons(
                // onDecrement: widget.decrement(counter),
                // onIncrement: increment(),
                // onSubmitted: ,
                onChanged: ((newValue) {}),
                decIconColor: Color(0xffB1D0E0),
                incIconColor: Color(0xffB1D0E0),
                style: detailTitleFieldTextStyle,
                controller: counterTextEditingController,
                incDecBgColor: Color(0xff406882),
                min: 0,
                max: 20,
                initialValue: 0,
                buttonArrangement: ButtonArrangement.incRightDecLeft,
              ),
            )
          ],
        ),
      ),
    );
  }
}
