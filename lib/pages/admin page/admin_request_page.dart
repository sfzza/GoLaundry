// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/history_admin_page.dart';
import 'package:golaundry/pages/admin%20page/onprogress_admin_page.dart';
import 'package:golaundry/theme.dart';

class AdminRequestPage extends StatelessWidget {
  List<Tab> requestTab = [
    Tab(text: "On Progress"),
    Tab(
      text: "History",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Color(0xff6998AB),
            appBar: PreferredSize(
              child: AppBar(
                title: Text(
                  'REQUEST',
                  style: titlePageTextStyle,
                ),
                elevation: 0,
                backgroundColor: Color(0xffB1D0E0),
                bottom: TabBar(
                  unselectedLabelColor: Color(0xff6998AB),
                  unselectedLabelStyle: tabBarTextStyle,
                  labelColor: Color(0xff1A374D),
                  labelStyle: tabBarTextStyle,
                  indicatorColor: Color(0xff1A374D),
                  tabs: requestTab,
                ),
              ),
              preferredSize: Size.fromHeight(110),
            ),
            body: TabBarView(
                children: [OnprogressAdminPage(), historyAdminPage()])),
      ),
    );
  }
}
