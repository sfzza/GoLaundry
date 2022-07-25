// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golaundry/pages/customer%20page/customer_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/theme.dart';

class customerLogin extends StatefulWidget {
  // const customerLogin({Key? key}) : super(key: key);

  @override
  State<customerLogin> createState() => _customerLoginState();
}

class _customerLoginState extends State<customerLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      loginCustomerNow();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Please write email/password.",
            );
          });
    }
  }

  loginCustomerNow() async {
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      // Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });

    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!);
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("customers")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!
            .setString("email", snapshot.data()!["cust_email"]);
        await sharedPreferences!
            .setString("name", snapshot.data()!["cust_name"]);

        // Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const customerPage()));
      } else {
        firebaseAuth.signOut();

        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: "No record found.",
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 65, left: 30.0, bottom: 40),
          child: Text(
            'Log in to continue',
            style: titleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 54, right: 54),
          child: TextFormField(
              controller: emailTextEditingController,
              cursorColor: Color(0xff1A374D),
              decoration: InputDecoration(
                hintText: "Email Address",
                hintStyle: hintTextStyle,
                fillColor: Color(0xffB1D0E0),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(color: Color(0xff406882), width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(color: Color(0xff1A374D), width: 3)),
              ),
              style: textFieldTextStyle),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 54, right: 54),
          child: TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'\s'))
              ],
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
                    borderSide: BorderSide(color: Color(0xff406882), width: 3)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(color: Color(0xff1A374D), width: 3)),
              ),
              style: textFieldTextStyle),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 54),
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: thinTextStyle,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 49),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1, 2),
                    blurRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(9)),
              ),
              width: 267,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff406882),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                onPressed: () {
                  validateForm();
                },
                child: Text(
                  'Log In',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: thinTextStyle,
              ),
              TextButton(
                onPressed: () {
                  DefaultTabController.of(context)!.animateTo(0);
                },
                child: Text(
                  "Sign up",
                  style: thinButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
