// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../theme.dart';

class Details extends StatefulWidget {
  // const Details({Key? key, required this.number}) : super(key: key);
  // final String number;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: SafeArea(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xffB1D0E0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                child: CircleAvatar(
                  backgroundColor: Color(0xff406882),
                  radius: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "T-Shirt",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: detailTitleFieldTextStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Rp 15,000",
                        style: detailSubtitleFieldTextStyle,
                      )
                    ]),
              ),
              SizedBox(width: 90),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: Color(0xff406882),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("")),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.do_not_disturb_on_rounded,
                      color: Color(0xff406882),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
