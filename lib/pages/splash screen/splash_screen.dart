// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/admin_page.dart';
import 'package:golaundry/pages/customer%20page/customer_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/userlevel_page.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      // if (await firebaseAuth.currentUser != null) {
      //   currentFirebaseUser = firebaseAuth.currentUser;

      //   if (sharedPreferences!.getString("status") != "admin") {
      //     //if customer
      //     // firebaseAuth.currentUser != null
      //     //     ? currentFirebaseUser = firebaseAuth.currentUser
      //     //     : null;
      //     // print("This is customer");
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (c) => AdminPage()),
      //         (Route<dynamic> route) => false);
      //   } else if (sharedPreferences!.getString("status") != "customer") {
      //     //if tech
      //     // firebaseAuth.currentUser != null
      //     //     ? currentFirebaseUser = firebaseAuth.currentUser
      //     //     : null;
      //     // print("This is technician");
      //     Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (c) => customerPage()),
      //         (Route<dynamic> route) => false);
      //   }
      // } else {
      //   // Fluttertoast.showToast(msg: "Invalid data.");
      //   Navigator.pushAndRemoveUntil(
      //       context,
      //       MaterialPageRoute(builder: (c) => const UserLevelPage()),
      //       (Route<dynamic> route) => false);
      // }
      if (firebaseAuth.currentUser != null) {
        currentFirebaseUser = firebaseAuth.currentUser;
        CollectionReference<Map<String, dynamic>> custRef =
            FirebaseFirestore.instance.collection('customers');
        custRef.doc(currentFirebaseUser!.uid).get().then((snapshot) async {
          if (snapshot != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => const customerPage()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => const AdminPage()));
          }
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const UserLevelPage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB1D0E0),
      body: Center(
        child: Image.asset(
          'assets/Logo.png',
          width: 271,
          height: 95,
        ),
      ),
    );
  }
}
