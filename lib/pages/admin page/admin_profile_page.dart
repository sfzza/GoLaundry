// ignore_for_file: unused_field, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/admin%20page/pricing_page.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';

import '../global/global.dart';
import '../userlevel_page.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController fareTextEditingController = TextEditingController();
  TextEditingController hourTextEditingController = TextEditingController();

  // void _handleImageSelection() async {
  //   final result = await ImagePicker().pickImage(
  //     imageQuality: 70,
  //     maxWidth: 1440,
  //     source: ImageSource.gallery,
  //   );

  //   if (result != null) {
  //     final bytes = await result.readAsBytes();
  //     final image = await decodeImageFromList(bytes);
  //   }
  // }

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
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("admins").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            return ListView(
              children: [
                Divider(
                  color: Color(0xff6998AB),
                ),
                // ListTile(
                //   contentPadding: EdgeInsets.only(left: 20),
                //   title: Text(
                //     'Edit Profile',
                //     style: profilePageTextStyle,
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => customerEditProfilePage()),
                //     );
                //     // Navigator.of(context).pushNamed('/custeditprofilepage');
                //   },
                // ),
                // Divider(
                //   color: Color(0xff6998AB),
                // ),
                // ListTile(
                //   contentPadding: EdgeInsets.only(left: 20),
                //   title: Text(
                //     'Delivery Address',
                //     style: profilePageTextStyle,
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => customerAddressPage()),
                //     );
                //     // Navigator.of(context).pushNamed('/custaddresspage');
                //   },
                // ),
                // Divider(
                //   color: Color(0xff6998AB),
                // ),
                // ListTile(
                //   contentPadding: EdgeInsets.only(left: 20),
                //   title: Text(
                //     'Payment Method',
                //     style: profilePageTextStyle,
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => customerPaymentPage()),
                //     );
                //     // Navigator.of(context).pushNamed('/custpaymentpage');
                //   },
                // ),
                // Divider(
                //   color: Color(0xff6998AB),
                // ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  title: Text(
                    'Pricing',
                    style: profilePageTextStyle,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PricingPage()),
                    );
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
                ),
              ],
            );
          }),
    );
  }
}
