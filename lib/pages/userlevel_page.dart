// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:golaundry/pages/authentication/views/customer_verification.dart.dart';
import 'package:golaundry/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'authentication/views/admin_verification_page.dart';

class UserLevelPage extends StatefulWidget {
  const UserLevelPage({Key? key}) : super(key: key);

  @override
  State<UserLevelPage> createState() => _UserLevelPageState();
}

class _UserLevelPageState extends State<UserLevelPage> {
  @override
  Widget build(BuildContext context) {
    Widget admin(String user, String imageUrl) {
      return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => adminVerificationPage(
                    selectedPage: 0,
                  )),
        ),
        child: Container(
          width: 149,
          height: 149,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 2),
                blurRadius: 2.0,
              )
            ],
            color: Color(0xff6998AB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Color(0xff1A374D)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Image.asset(
                  imageUrl,
                  width: 90,
                  height: 90,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(user,
                    style: GoogleFonts.roboto(
                        color: Color(0xff1A374D),
                        fontSize: 20,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      );
    }

    Widget customer(String user, String imageUrl) {
      return InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => customerVerificationPage(
                    selectedPage: 0,
                  )),
        ),
        child: Container(
          width: 149,
          height: 149,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1, 2),
                blurRadius: 2.0,
              )
            ],
            color: Color(0xff6998AB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: Color(0xff1A374D)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Image.asset(
                  imageUrl,
                  width: 90,
                  height: 90,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(user,
                    style: GoogleFonts.roboto(
                        color: Color(0xff1A374D),
                        fontSize: 20,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffB1D0E0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Column(
            children: [
              Image.asset(
                'assets/golaundry-02.png',
                width: 300,
                height: 110,
              ),
              SizedBox(
                height: 160,
              ),
              Text(
                'Which one are you?',
                style: GoogleFonts.roboto(
                    color: Color(0xff1A374D),
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  admin('admin', 'assets/admin.png'),
                  customer('customer', 'assets/customer.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
