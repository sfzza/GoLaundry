// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/customer_homepage.dart';
import 'package:golaundry/pages/customer%20page/customer_myorder_page.dart';
import 'package:golaundry/pages/customer%20page/customer_notification_page.dart';
import 'package:golaundry/pages/customer%20page/customer_profile_page.dart';

import 'package:golaundry/pages/widgets/laundry_choices.dart';
import 'package:golaundry/pages/widgets/popular_laundry.dart';
import 'package:golaundry/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class customerPage extends StatefulWidget {
  const customerPage({Key? key}) : super(key: key);

  @override
  State<customerPage> createState() => _customerPageState();
}

class _customerPageState extends State<customerPage> {
  int currentIndex = 0;
  final screens = [
    customerHomePage(),
    customerMyOrderPage(),
    customerNotificationPage(),
    customerProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xffB1D0E0),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: BottomNavigationBar(
            backgroundColor: Color(0xffB1D0E0),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: selectedNavLaundryTextStyle,
            unselectedLabelStyle: unselectedNavLaundryTextStyle,
            unselectedItemColor: Color(0xff6998AB),
            selectedItemColor: Color(0xff1A374D),
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
            currentIndex: currentIndex,
            elevation: 0,
            iconSize: 24,
            items: [
              BottomNavigationBarItem(
                icon: Text(''),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Text(''),
                label: 'my order',
              ),
              BottomNavigationBarItem(
                icon: Text(''),
                label: 'notification',
              ),
              BottomNavigationBarItem(
                icon: Text(''),
                label: 'profile',
              ),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
