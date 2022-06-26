import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/onprogress_customer.dart';

import '../../theme.dart';

class OnprogressCustomerPage extends StatefulWidget {
  const OnprogressCustomerPage({Key? key}) : super(key: key);

  @override
  State<OnprogressCustomerPage> createState() => _OnprogressCustomerPageState();
}

class _OnprogressCustomerPageState extends State<OnprogressCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .where("id_cust", isEqualTo: sharedPreferences!.getString("uid"))
              .where("statusBook", isEqualTo: "ongoing")
              .snapshots(),
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

                return OnprogressCustomerCard(
                    cust_address: data["cust_address"],
                    cust_email: data["cust_email"],
                    laundry_name: data["laundry_name"],
                    total:
                        "${data["laundry_fare"] + (data["price"] * data["quantity"] ?? "")}");
              }).toList(),
            );
          }),
    );
  }
}
