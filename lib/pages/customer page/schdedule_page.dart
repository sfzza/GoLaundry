import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/checkout_page.dart';

import '../../theme.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "SCHEDULE",
            style: titlePageTextStyle,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Color(0xff1A374D),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              color: Color(0xff1A374D),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Color(0xffB1D0E0),
        ),
        preferredSize: Size.fromHeight(80),
      ),
    );
  }
}
