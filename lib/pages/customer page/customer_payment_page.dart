// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/payment.dart';
import 'package:golaundry/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global/global.dart';
import '../widgets/error_dialog.dart';

class customerPaymentPage extends StatefulWidget {
  @override
  State<customerPaymentPage> createState() => _customerPaymentPageState();
}

class _customerPaymentPageState extends State<customerPaymentPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget Cash(int index, String cash) {
      return GestureDetector(
        onTap: () => setState(
          () {
            selectedIndex = index;
            final payment = Payment(
              payment: cash,
            ).toJson();

            FirebaseFirestore.instance
                .collection("customers")
                .doc(sharedPreferences!.getString("uid"))
                .update(payment)
                .then((value) async {
              showDialog(
                  context: context,
                  builder: (c) {
                    return ErrorDialog(
                      message: "Payment method has been saved.",
                    );
                  });
              sharedPreferences = await SharedPreferences.getInstance();
              await sharedPreferences!.setString("payment", cash);
            });
          },
        ),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("customers")
                .doc(sharedPreferences!.getString("uid"))
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data?["payment"] == "Cash of Delivery") {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Container(
                    height: 129,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffB1D0E0),
                      border: Border.all(width: 2, color: Color(0xff1A374D)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 18, right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cash,
                            style: paymentTextStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Color(0xff1A374D),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'your current payment',
                                style: addressStatusTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Card(
                child: Container(
                  height: 129,
                  width: MediaQuery.of(context).size.width * 0.96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffB1D0E0),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffB1D0E0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18, top: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cash,
                          style: paymentTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }

    Widget Credit(int index, String credit) {
      return GestureDetector(
        onTap: () => setState(
          () {
            selectedIndex = index;
            final payment = Payment(
              payment: credit,
            ).toJson();

            FirebaseFirestore.instance
                .collection("customers")
                .doc(sharedPreferences!.getString("uid"))
                .update(payment)
                .then((value) {
              showDialog(
                  context: context,
                  builder: (c) {
                    return ErrorDialog(
                      message: "Payment method has been saved.",
                    );
                  });
            });
          },
        ),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("customers")
                .doc(sharedPreferences!.getString("uid"))
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data?["payment"] == "Credit Card") {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Container(
                    height: 129,
                    width: MediaQuery.of(context).size.width * 0.96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffB1D0E0),
                      border: Border.all(width: 2, color: Color(0xff1A374D)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 18, top: 18, right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            credit,
                            style: paymentTextStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Color(0xff1A374D),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'your current payment',
                                style: addressStatusTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  height: 129,
                  width: MediaQuery.of(context).size.width * 0.96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffB1D0E0),
                    border: Border.all(
                      width: 2,
                      color: Color(0xffB1D0E0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18, top: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          credit,
                          style: paymentTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'PAYMENT METHOD',
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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 6,
            ),
            Cash(0, 'Cash of Delivery'),
            // SizedBox(
            //   height: 6,
            // ),
            Credit(1, 'Credit Card'),
          ],
        ),
      ),
    );
  }
}
