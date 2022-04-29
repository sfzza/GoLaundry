// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/authentication/views/login_admin.dart';
import 'package:golaundry/pages/authentication/views/signup_admin.dart';
import 'package:golaundry/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class adminVerificationPage extends StatelessWidget {
  adminVerificationPage({Key? key}) : super(key: key);

  List<Tab> userTab = [
    Tab(text: "Sign Up"),
    Tab(
      text: "Log In",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xffB1D0E0),
          appBar: PreferredSize(
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                color: Color(0xff1A374D),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Color(0xffB1D0E0),
              bottom: TabBar(
                unselectedLabelColor: Color(0xff6998AB),
                unselectedLabelStyle: tabBarTextStyle,
                labelColor: Color(0xff1A374D),
                labelStyle: tabBarTextStyle,
                indicatorColor: Color(0xff1A374D),
                tabs: userTab,
              ),
            ),
            preferredSize: Size.fromHeight(80),
          ),
          body: TabBarView(children: [
            adminSignup(),
            adminLogin(),
          ]),
        ),
      ),
    );
  }
}
