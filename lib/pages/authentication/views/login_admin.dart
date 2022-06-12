import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:golaundry/pages/admin%20page/admin_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/userlevel_page.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/theme.dart';

class adminLogin extends StatefulWidget {
  // const adminLogin({Key? key}) : super(key: key);

  @override
  State<adminLogin> createState() => _adminLoginState();
}

class _adminLoginState extends State<adminLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (emailTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      loginAdminNow();
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

  loginAdminNow() async {
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });

    if (currentUser != null) {
      readDataAndSetDataLocally(currentUser!).then((value) {
        // Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AdminPage()));
      });
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("admins")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        await sharedPreferences!.setString("uid", currentUser.uid);
        await sharedPreferences!
            .setString("email", snapshot.data()!["laundry_email"]);
        await sharedPreferences!
            .setString("name", snapshot.data()!["laundry_name"]);
        // List<String> laundrytags =
        //     snapshot.data()!["laundry_tags"].cast<String>();
        // await sharedPreferences!.setStringList("laundry_tags", laundrytags);
        // Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const AdminPage()));
      } else {
        firebaseAuth.signOut();
        // Navigator.pop(context);
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (c) => const UserLevelPage()));

        showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "No record found.",
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      ]),
    );
  }
}
