// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';
import '../global/global.dart';
import '../models/address.dart';
import '../widgets/progress_bar.dart';
import '../widgets/total_payment.dart';

class CheckoutPage extends StatefulWidget {
  // const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
  final String id_laundry;
  final Address? model;
  CheckoutPage({required this.id_laundry, this.model});
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6998AB),
        appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "YOUR ORDER",
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color(0xffB1D0E0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            "Pickup Date",
                            style: detailTitleFieldTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25),
                          child: Text(
                            "Wednesday, June 15 2022",
                            style: detailSubtitleFieldTextStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xffB1D0E0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              "Email",
                              style: detailTitleFieldTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              sharedPreferences!.getString("email")!,
                              style: detailSubtitleFieldTextStyle,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection("customers")
                          .doc(sharedPreferences!.getString("uid")!)
                          .collection("cust_address")
                          .doc(sharedPreferences!.getString("uid")!)
                          .snapshots(),
                      builder: (context, snapshot) {
                        return Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Color(0xffB1D0E0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Text(
                                    "Address",
                                    style: detailTitleFieldTextStyle,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Container(
                                      width: 150,
                                      child: Text(
                                        snapshot.data?["fullAddress"],
                                        style: detailSubtitleFieldTextStyle,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xffB1D0E0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Text(
                              "Payment",
                              style: detailTitleFieldTextStyle,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(right: 25),
                              child: Text(
                                "payment",
                                style: detailSubtitleFieldTextStyle,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 90),
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
                              child:
                                  Text("Place Order", style: buttonTextStyle))))
                ],
              ),
            ),
            StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("admins")
                    .doc(widget.id_laundry)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return circularProgress();
                  }
                  return Positioned(
                      bottom: 0,
                      child: TotalPayment(
                        total: "${snapshot.data?["laundry_fare"]}",
                      ));
                })
          ],
        ));
  }
}
