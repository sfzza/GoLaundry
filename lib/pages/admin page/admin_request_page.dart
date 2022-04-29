import 'package:flutter/material.dart';
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
          body: TabBarView(children: [
            Center(
              child: Text(
                'currently you dont have any order on progress',
                style: noHistoryTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                'currently you dont have any order history',
                style: noHistoryTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
