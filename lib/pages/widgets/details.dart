// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Color(0xffB1D0E0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Image(
            //     image: AssetImage("assets/laundry.png"),
            //     height: 80,
            //     width: 80,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.item,
                    style: detailTitleFieldTextStyle,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  // Text(
                  //   ": ",
                  //   style: detailTitleFieldTextStyle,
                  // ),
                  Row(
                    children: [
                      Text("RP ", style: detailSubtitleFieldTextStyle),
                      Text(
                        widget.price,
                        style: detailSubtitleFieldTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xff406882),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.remove,
                          color: Color(0xffB1D0E0),
                        ),
                      ),
                      Text(
                        "1",
                        style: TextStyle(color: Color(0xffB1D0E0)),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.add,
                          color: Color(0xffB1D0E0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
