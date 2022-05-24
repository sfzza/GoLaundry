import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
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
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
                  child: TextFormField(
                      controller: nameTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        hintText: "Laundry Name",
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
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff406882), width: 3),
                    ),
                    height: 58,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffB1D0E0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Choose Picture",
                              style: hintTextStyle,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff6998AB),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
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
                            borderSide:
                                BorderSide(color: Color(0xff406882), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff1A374D), width: 3)),
                      ),
                      style: textFieldTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
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
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
                  child: TextFormField(
                      controller: fareTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        hintText: "Fare per 1 KM",
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
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
                  child: TextFormField(
                      controller: hourTextEditingController,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        hintText: "Operation Hour",
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
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff406882), width: 3),
                    ),
                    height: 58,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffB1D0E0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Pricing",
                              style: hintTextStyle,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff6998AB),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff406882), width: 3),
                    ),
                    height: 58,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffB1D0E0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Choose Tags",
                              style: hintTextStyle,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xff6998AB),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
