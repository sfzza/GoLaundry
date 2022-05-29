// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/schdedule_page.dart';

import '../../theme.dart';
import '../widgets/details.dart';

class AddDetailsPage extends StatefulWidget {
  final String id_laundry;
  AddDetailsPage({required this.id_laundry});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "ADD DETAILS",
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
                  MaterialPageRoute(builder: (context) => SchedulePage()),
                );
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Color(0xffB1D0E0),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [Details(), Details(), Details()],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                    color: Color(0xffB1D0E0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
