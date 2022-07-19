// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/progressAdminCard.dart';
import '../../theme.dart';
import '../global/global.dart';
import '../widgets/progress_bar.dart';

class OnprogressAdminPage extends StatefulWidget {
  // const OnprogressAdminPage({Key? key, this.id_booking}) : super(key: key);
  final String? id_booking;
  OnprogressAdminPage({this.id_booking});
  @override
  State<OnprogressAdminPage> createState() => _OnprogressPageState();
}

class _OnprogressPageState extends State<OnprogressAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .where("id_laundry",
                  isEqualTo: sharedPreferences!.getString("uid"))
              .where("statusBook", isEqualTo: "ongoing")
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: circularProgress(),
                  )
                : snapshot.data!.docs.isEmpty
                    ? Center(
                        child: Text(
                          'currently you dont have any order on progress',
                          style: noHistoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView(
                        children: snapshot.data!.docs.map((docs) {
                        Map<String, dynamic> data =
                            docs.data()! as Map<String, dynamic>;

                        return ProgressAdminCard(
                            payment: data["payment"],
                            delivAddress: data["delivAddress"],
                            id_booking: data["id_booking"],
                            cust_address: data["cust_address"],
                            cust_email: data["cust_email"],
                            total:
                                "${data["laundry_fare"] + (data["price"] * data["quantity"] ?? "")}");
                      }).toList());
          }),
    );
  }
}
