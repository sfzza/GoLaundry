import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class customerEditProfilePage extends StatelessWidget {
  const customerEditProfilePage({Key? key}) : super(key: key);

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
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 54, right: 54, top: 50),
          child: TextFormField(
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
                onPressed: () {},
                child: Text(
                  'Save',
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
