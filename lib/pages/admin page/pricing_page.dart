// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/models/pricing.dart';

import '../../theme.dart';
import '../widgets/error_dialog.dart';

class PricingPage extends StatefulWidget {
  // const PricingPage({Key? key}) : super(key: key);

  @override
  final String? id_laundry;
  PricingPage({this.id_laundry});
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  final formKey = GlobalKey<FormState>();
  final _tshirt = TextEditingController();
  final _dress = TextEditingController();
  final _bottom = TextEditingController();
  final _underclothes = TextEditingController();
  final _jeans = TextEditingController();
  final _bag = TextEditingController();
  final _shoes = TextEditingController();
  final _bedsheet = TextEditingController();
  final _blanket = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6998AB),
        appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "PRICING",
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
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                  controller: _tshirt,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "T-shirt",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _dress,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Dress",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _bottom,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Bottom",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _underclothes,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Underclothes",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _jeans,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Jeans",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _bag,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Bag",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _shoes,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Shoes",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _bedsheet,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Bed Sheet",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: TextFormField(
                  controller: _blanket,
                  cursorColor: Color(0xff1A374D),
                  decoration: InputDecoration(
                    labelText: "Blanket",
                    labelStyle: textFieldTextStyle,
                    hintText: "set your price here! e.g. 15000",
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 49, bottom: 30),
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
                    onPressed: () async {
                      // if (formKey.currentState!.validate()) {

                      final priceMap = Pricing(
                              id_laundry: sharedPreferences!.getString("uid"),
                              tshirt: int.parse(_tshirt.text),
                              // tshirt: int.tryParse(_tshirt.text.trim()),
                              dress: int.parse(_dress.text),
                              bottom: int.parse(_bottom.text),
                              underclothes: int.parse(_underclothes.text),
                              jeans: int.parse(_jeans.text),
                              bag: int.parse(_bag.text),
                              shoes: int.parse(_shoes.text),
                              bedsheet: int.parse(_bedsheet.text),
                              blanket: int.parse(_blanket.text))
                          .toJson();

                      FirebaseFirestore.instance
                          .collection("admins")
                          .doc(sharedPreferences!.getString("uid"))
                          .collection("pricing")
                          .doc(sharedPreferences!.getString("uid"))
                          .set(priceMap)
                          .then((value) {
                        showDialog(
                            context: context,
                            builder: (c) {
                              return ErrorDialog(
                                message: "pricing has been saved.",
                              );
                            });
                      });
                      // Navigator.pop(
                      //   context,
                      // );
                    },
                    // },
                    child: Text(
                      'Save',
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
