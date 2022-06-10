import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/customer_page.dart';
import 'package:golaundry/pages/authentication/views/customer_verification.dart.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/pages/widgets/loading_dialog.dart';
import 'package:golaundry/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class customerSignup extends StatefulWidget {
  const customerSignup({Key? key}) : super(key: key);

  @override
  State<customerSignup> createState() => _customerSignupState();
}

class _customerSignupState extends State<customerSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  Future<void> validateForm() async {
    if (nameTextEditingController.text.length < 3) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Name must be more than 3 characters');
          });
    } else if (!emailTextEditingController.text.contains('@')) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter an email address!');
          });
    } else if (phoneTextEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter phone number!');
          });
    } else if (passwordTextEditingController.text.length < 6) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
                message: 'Password must be atleast 6 characters!');
          });
    } else {
      saveCustomerInfoNow();
      LoadingDialog(message: 'make an account');
    }
  }

  void saveCustomerInfoNow() async {
    User? currentUser;
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError(
      (error) {
        showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: error.message.toString(),
              );
            });
      },
    );

    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        Route newRoute = MaterialPageRoute(builder: (c) => customerPage());
        Navigator.pushReplacement(context, newRoute);
      });
    }
  }

  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance
        .collection("customers")
        .doc(currentUser.uid)
        .set({
      "id_cust": currentUser.uid,
      "cust_email": currentUser.email,
      "cust_name": nameTextEditingController.text.trim(),
      "cust_phone": phoneTextEditingController.text.trim(),
      "cust_password": passwordTextEditingController.text.trim(),
      "status": "approved",
    });

    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email.toString());
    await sharedPreferences!
        .setString("name", nameTextEditingController.text.trim());

    // await sharedPreferences!
    //     .setString("phone", phoneTextEditingController.text.trim());
    // await sharedPreferences!
    //     .setString("password", passwordTextEditingController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 65, left: 30.0, bottom: 40),
          child: Text(
            'Join GoLaundry',
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
              controller: nameTextEditingController,
              cursorColor: Color(0xff1A374D),
              decoration: InputDecoration(
                hintText: "Name",
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
              controller: phoneTextEditingController,
              cursorColor: Color(0xff1A374D),
              decoration: InputDecoration(
                hintText: "Phone Number",
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
                onPressed: () {
                  validateForm();

                  // Navigator.of(context).pushNamed('/customerpage');
                },
                child: Text(
                  'Sign Up',
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
