import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/history_admin.dart';

import '../../theme.dart';
import '../global/global.dart';

class historyAdminPage extends StatefulWidget {
  const historyAdminPage({Key? key}) : super(key: key);

  @override
  State<historyAdminPage> createState() => _historyAdminPageState();
}

class _historyAdminPageState extends State<historyAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6998AB),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .where("id_laundry",
                  isEqualTo: sharedPreferences!.getString("uid"))
              .where("statusBook",
                  whereIn: ["accepted", "rejected"]).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child:
                      // ignore: unnecessary_const
                      const SizedBox(
                height: 2,
              )
                  // Text(
                  //   'currently you dont have any order on progress',
                  //   style: noHistoryTextStyle,
                  //   textAlign: TextAlign.center,
                  // ),
                  );
            }
            return ListView(
                children: snapshot.data!.docs.map((docs) {
              Map<String, dynamic> data = docs.data()! as Map<String, dynamic>;

              return HistoryAdminCard(
                cust_address: data["cust_address"],
                cust_email: data["cust_email"],
                total:
                    "${data["laundry_fare"] + (data["price"] * data["quantity"] ?? "")}",
                statusBook: data['statusBook'],
              );
            }).toList());
          }),
    );
  }
}
