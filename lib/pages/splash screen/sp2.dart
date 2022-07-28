// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/admin_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/userlevel_page.dart';

import '../customer page/customer_page.dart';

class splashScreen extends StatefulWidget {
  final SplashScreenModel? model;
  const splashScreen({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    checkRoleAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB1D0E0),
      body: Center(
        child: Image.asset(
          'assets/golaundry-02.png',
          width: 270,
          height: 80,
        ),
      ),
    );
  }

  checkRoleAndNavigate() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      final Role? role = await widget.model?.init();
      if (role == Role.admins) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => AdminPage()));
      } else if (role == Role.customers) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => customerPage()));
      }
    });
  }
}

class SplashScreenModel {
  Future<Role> init() async {
    final user = FirebaseAuth.instance.currentUser;
    final snap = await FirebaseFirestore.instance
        .collection('customers')
        .doc(user!.uid)
        .get();
    final role = snap['role'];
    if (role == 'customers') {
      return Role.customers;
    } else {
      return Role.admins;
    }
  }
}

enum Role { customers, admins }
