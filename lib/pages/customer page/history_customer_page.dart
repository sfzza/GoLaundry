// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/history_customer.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';

import '../../theme.dart';

class HistoryCustomerPage extends StatefulWidget {
  const HistoryCustomerPage({Key? key}) : super(key: key);

  @override
  State<HistoryCustomerPage> createState() => _HistoryCustomerPageState();
}

class _HistoryCustomerPageState extends State<HistoryCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .where("id_cust", isEqualTo: sharedPreferences!.getString("uid"))
              .where("statusBook",
                  whereIn: ["accepted", "rejected"]).snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: circularProgress(),
                  )
                : snapshot.data!.docs.isEmpty
                    ? Center(
                        child: Text(
                          'currently you dont have any order on history',
                          style: noHistoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView(
                        children: snapshot.data!.docs.map((docs) {
                          Map<String, dynamic> data =
                              docs.data()! as Map<String, dynamic>;

                          return HistoryCustomerCard(
                            payment: data["payment"] ?? "",
                            delivAddress: data["delivAddress"] ?? "",
                            cust_address: data["cust_address"] ?? "",
                            cust_email: data["cust_email"] ?? "",
                            laundry_name: data['laundry_name'] ?? "",
                            statusBook: data['statusBook'] ?? "",
                            total:
                                "${data["laundry_fare"] + (data["price"] * data["quantity"] ?? "")}",
                          );
                        }).toList(),
                      );
          }),
    );
  }
}
