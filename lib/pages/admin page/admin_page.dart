// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/admin_homepage.dart';
import 'package:golaundry/pages/admin%20page/admin_notification_page.dart';
import 'package:golaundry/pages/admin%20page/admin_profile_page.dart';
import 'package:golaundry/pages/admin%20page/admin_request_page.dart';
import 'package:golaundry/theme.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int currentIndex = 0;
  final screens = [
    AdminHomePage(),
    AdminRequestPage(),
    AdminNotificationPage(),
    AdminProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              label: 'request',
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
    );
  }
}
