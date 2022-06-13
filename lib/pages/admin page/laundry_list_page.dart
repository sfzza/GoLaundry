// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/laundry_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/laundry_list.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';

class LaundryListPage extends StatefulWidget {
  const LaundryListPage({Key? key}) : super(key: key);

  @override
  State<LaundryListPage> createState() => _LaundryListPageState();
}

class _LaundryListPageState extends State<LaundryListPage> {
  double calculateDistance(lat, lon) {
    double? latCal = sharedPreferences!.getDouble("lng");
    double? lonCal = sharedPreferences!.getDouble("lat");
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat - latCal) * p) / 2 +
        c(latCal! * p) * c(lat * p) * (1 - c((lon - lonCal) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff6998AB),
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("admins").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            return ListView(
              children: snapshot.data!.docs.map((docs) {
                Map<String, dynamic> data =
                    docs.data()! as Map<String, dynamic>;

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LaundryPage(
                              id_laundry: data['id_laundry'].toString())),
                    );
                  },
                  child: LaundryList(
                    laundry_name: data["laundry_name"],
                    laundry_hour: data["laundry_hour"],
                    distance: "",
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
