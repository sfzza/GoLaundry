// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/theme.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 80, bottom: 30),
            child: Image.asset(
              'assets/golaundry-02.png',
              width: 231,
              height: 55,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 10),
          child: Row(
            children: [
              Text(
                "Welcome to GoLaundry! ",
                style: nameTextStyle,
              ),
              Text(
                sharedPreferences!.getString("name")!,
                style: nameTextStyle,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, bottom: 120),
          child: Text(
            "Dont forget to fill your laundry \nservices information.",
            style: greetTextStyle,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/detergent.png',
            height: 200,
            width: 200,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        // Container(
        //   width: 400,
        //   height: 40,
        //   alignment: Alignment.center,
        //   child: ElevatedButton(
        //     onPressed: () {
        //       firebaseAuth.signOut();
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(builder: (context) => UserLevelPage()),
        //       );
        //     },
        //     child: Text('Signout'),
        //     style: ElevatedButton.styleFrom(primary: Colors.red),
        //   ),
        // ),
      ],
    );
  }
}
