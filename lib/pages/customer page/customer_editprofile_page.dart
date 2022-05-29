// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/customer.dart';
import 'package:golaundry/theme.dart';

import '../global/global.dart';

class customerEditProfilePage extends StatefulWidget {
  // const customerEditProfilePage({Key? key}) : super(key: key);

  @override
  State<customerEditProfilePage> createState() =>
      _customerEditProfilePageState();
  // Customers customer;
  // final String? data;
  // customerEditProfilePage({required this.customer});
}

class _customerEditProfilePageState extends State<customerEditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  // Future getDataToFirestore(User? currentUser) async {
  //   FirebaseFirestore.instance
  //       .collection("customers")
  //       .doc(currentUser!.uid)
  //       .get({

  //   });
  // }

  @override
  void initState() {
    // emailTextEditingController.text = sharedPreferences!.getString("email")!;
    // nameTextEditingController.text = sharedPreferences!.getString("name")!;
    // phoneTextEditingController.text = sharedPreferences!.getString("phone")!;
    // passwordTextEditingController.text =
    //     sharedPreferences!.getString("password")!;
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffB1D0E0),
        appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'EDIT PROFILE',
              style: titlePageTextStyle,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              color: Color(0xff1A374D),
              onPressed: () {
                Navigator.pop(context);
              },
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
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 54, right: 54, top: 50),
                  child: TextFormField(
                      controller: emailTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        // labelText: snapshot.data!['cust_email'],
                        hintText: "Email Address",
                        hintStyle: hintTextStyle,
                        fillColor: Color(0xffB1D0E0),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff406882), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff1A374D), width: 3)),
                      ),
                      style: textFieldTextStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 54, right: 54),
                  child: TextFormField(
                      controller: nameTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        hintText: "Name",
                        hintStyle: hintTextStyle,
                        fillColor: Color(0xffB1D0E0),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff406882), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff1A374D), width: 3)),
                      ),
                      style: textFieldTextStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 54, right: 54),
                  child: TextFormField(
                      controller: phoneTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: hintTextStyle,
                        fillColor: Color(0xffB1D0E0),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff406882), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff1A374D), width: 3)),
                      ),
                      style: textFieldTextStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 54, right: 54),
                  child: TextFormField(
                      controller: passwordTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: hintTextStyle,
                        fillColor: Color(0xffB1D0E0),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff406882), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff1A374D), width: 3)),
                      ),
                      style: textFieldTextStyle),
                ),
                SizedBox(
                  height: 11,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 49),
                    child: Container(
                      width: 267,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff406882),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ]);
            }));
  }
}
