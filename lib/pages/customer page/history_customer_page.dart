import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/history_customer.dart';

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
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'currently you dont have any order on progress',
                  style: noHistoryTextStyle,
                  textAlign: TextAlign.center,
                ),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((docs) {
                Map<String, dynamic> data =
                    docs.data()! as Map<String, dynamic>;

                return HistoryCustomerCard(
                  cust_address: data["cust_address"],
                  cust_email: data["cust_email"],
                  laundry_name: data['laundry_name'],
                  statusBook: data['statusBook'],
                  total: "${data["price"] + data["laundry_fare"]}",
                );
              }).toList(),
            );
          }),
    );
  }
}
