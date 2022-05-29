// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/chat/chat_screen.dart';
import 'package:golaundry/pages/customer%20page/add_details_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/models/laundries.dart';
import 'package:golaundry/pages/widgets/laundry_detail.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';

class LaundryPage extends StatefulWidget {
  @override
  State<LaundryPage> createState() => _LaundryPageState();
  final String id_laundry;
  LaundryPage({required this.id_laundry});
}

class _LaundryPageState extends State<LaundryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB1D0E0),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 296,
            child: Image.asset(
              "assets/fotolaundry.png",
              height: 296,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("admins")
                  .doc(widget.id_laundry)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                return ListView(
                  children: [
                    SizedBox(
                      height: 266,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          color: Color(0xffB1D0E0)),
                      child: LaundryDetail(
                        laundry_name: snapshot.data?["laundry_name"],
                        laundry_address: snapshot.data?["laundry_address"],
                        laundry_fare: snapshot.data?["laundry_fare"],
                        laundry_hour: snapshot.data?["laundry_hour"],
                        laundry_phone: snapshot.data?["laundry_phone"],
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 49),
                        child: Container(
                          width: 267,
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff406882),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddDetailsPage(
                                          id_laundry:
                                              snapshot.data?["id_laundry"],
                                        )),
                              );
                            },
                            child: Text(
                              'next',
                              style: buttonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
          Positioned(
            top: 20,
            left: 20,
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              minWidth: 30,
              height: 30,
              padding: EdgeInsets.all(5),
              color: Color(0xffB1D0E0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Color(0xff406882),
                // size: 14,
              ),
            ),
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("admins")
                  .doc(widget.id_laundry)
                  .snapshots(),
              builder: (context, snapshot) {
                return Positioned(
                  top: 20,
                  right: 20,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                  id_laundry: snapshot.data?["id_laundry"],
                                )),
                      );
                    },
                    minWidth: 60,
                    height: 60,
                    padding: EdgeInsets.all(5),
                    color: Color(0xffB1D0E0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.chat_bubble_rounded,
                      color: Color(0xff406882),
                      size: 40,
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}
