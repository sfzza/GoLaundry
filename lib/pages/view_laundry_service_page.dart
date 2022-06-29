// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/laundry_list_page.dart';
import 'package:golaundry/theme.dart';

class viewLaundryServicePage extends StatefulWidget {
  const viewLaundryServicePage({Key? key}) : super(key: key);

  @override
  State<viewLaundryServicePage> createState() => _viewLaundryServicePageState();
}

class _viewLaundryServicePageState extends State<viewLaundryServicePage> {
  List<Tab> serviceTab = [
    Tab(
      text: "wash",
      icon: Image.asset(
        "assets/wash.png",
        width: 30,
      ),
    ),
    Tab(
      text: "iron",
      icon: Image.asset(
        "assets/iron.png",
        width: 30,
      ),
    ),
    Tab(
      text: "wash&iron",
      icon: Image.asset(
        "assets/wash&iron.png",
        width: 30,
      ),
    ),
    Tab(
      text: "dry",
      icon: Image.asset(
        "assets/dry.png",
        width: 30,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xffB1D0E0),
          appBar: PreferredSize(
            child: AppBar(
              // title: Text('laundry service'),
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
                tabs: serviceTab,
              ),
            ),
            preferredSize: Size.fromHeight(130),
          ),
          body: TabBarView(
            children: [
              LaundryListPage(),
              LaundryListPage(),
              LaundryListPage(),
              LaundryListPage(),
            ],
          ),
        ),
      ),
    );
  }
}
