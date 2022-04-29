import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/popular_laundry.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';
import 'package:golaundry/pages/global/global.dart';

import '../widgets/laundry_choices.dart';

class customerHomePage extends StatefulWidget {
  const customerHomePage({Key? key}) : super(key: key);

  @override
  State<customerHomePage> createState() => _customerHomePageState();
}

class _customerHomePageState extends State<customerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 80, bottom: 30),
              child: Image.asset(
                'assets/Logo.png',
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
                  "Hey, ",
                  style: nameTextStyle,
                ),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: nameTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, bottom: 30),
            child: Text(
              "Which laundry service\ndo you need today?",
              style: greetTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  laundryChoices(
                    imageUrl: 'assets/wash.png',
                    text: 'wash',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  laundryChoices(imageUrl: 'assets/iron.png', text: 'iron'),
                  SizedBox(
                    width: 15,
                  ),
                  laundryChoices(
                      imageUrl: 'assets/wash&iron.png', text: 'wash & iron'),
                  SizedBox(
                    width: 15,
                  ),
                  laundryChoices(imageUrl: 'assets/dry.png', text: 'dry'),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 45, bottom: 30, left: 30),
            child: Text(
              'Popular Laundry',
              style: homeTextStyle,
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("admins").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return circularProgress();
                }
                return SizedBox(
                  height: 190,
                  // width: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data!.docs.map((docs) {
                      Map<String, dynamic> data =
                          docs.data()! as Map<String, dynamic>;

                      return popularlaundry(
                          laundry_name: data["laundry_name"],
                          laundry_address: data["laundry_address"]);
                    }).toList(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
