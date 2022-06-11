// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/customer_address_page.dart';
import 'package:golaundry/pages/customer%20page/customer_payment_page.dart';

import 'package:golaundry/pages/customer%20page/customer_editprofile_page.dart';

import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/models/customer.dart';
import 'package:golaundry/pages/userlevel_page.dart';
import 'package:golaundry/theme.dart';

class customerProfilePage extends StatelessWidget {
  // const customerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB1D0E0),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'PROFILE',
            style: titlePageTextStyle,
          ),
          elevation: 0,
          backgroundColor: Color(0xffB1D0E0),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("customers")
              .doc(currentFirebaseUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            return ListView(
              children: [
                Divider(
                  color: Color(0xff6998AB),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text(
                    'Edit Profile',
                    style: profilePageTextStyle,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => customerEditProfilePage()),
                    );
                    // Navigator.of(context).pushNamed('/custeditprofilepage');
                  },
                ),
                Divider(
                  color: Color(0xff6998AB),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text(
                    'Delivery Address',
                    style: profilePageTextStyle,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => customerAddressPage()),
                    );
                    // Navigator.of(context).pushNamed('/custaddresspage');
                  },
                ),
                Divider(
                  color: Color(0xff6998AB),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text(
                    'Payment Method',
                    style: profilePageTextStyle,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => customerPaymentPage()),
                    );
                    // Navigator.of(context).pushNamed('/custpaymentpage');
                  },
                ),
                Divider(
                  color: Color(0xff6998AB),
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text(
                    'Logout',
                    style: profilePageTextStyle,
                  ),
                  onTap: () {
                    firebaseAuth.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => UserLevelPage()),
                    );
                  },
                ),
                Divider(
                  color: Color(0xff6998AB),
                )
              ],
            );
          }),
    );
  }
}
