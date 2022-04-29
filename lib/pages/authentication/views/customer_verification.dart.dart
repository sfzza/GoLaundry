// ignore_for_file: unused_import, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/authentication/views/login_customer_page.dart';
import 'package:golaundry/pages/authentication/views/signup_customer_page.dart';
import 'package:golaundry/theme.dart';
import 'package:google_fonts/google_fonts.dart';
// final GlobalKey<NavigatorState> _navkey = GlobalKey<NavigatorState>();

class customerVerificationPage extends StatefulWidget {
  customerVerificationPage({Key? key}) : super(key: key);

  @override
  State<customerVerificationPage> createState() =>
      _customerVerificationPageState();
}

class _customerVerificationPageState extends State<customerVerificationPage> {
  List<Tab> userTab = [
    Tab(text: "Sign up"),
    Tab(
      text: "Log In",
    ),
  ];
  // late final TabController _tabController;
  // @override
  // void initState() {
  //   _tabController = TabController(length: 2, vsync: this);
  //   super.initState();
  // }

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
            customerSignup(),
            customerLogin(),
          ]),

          // Navigator(
          //   key: _navkey,
          //   onGenerateRoute: (_) => MaterialPageRoute(
          //     builder: (_) => TabBarView(
          //       children: [customerLogin(), customerSignup()],
          //       controller: _tabController,
          //     ),
          // ),
          // ),
        ),
      ),
    );
  }
}
