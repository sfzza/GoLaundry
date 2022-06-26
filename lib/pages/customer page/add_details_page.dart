// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/schdedule_page.dart';
import 'package:golaundry/pages/models/booking.dart';
import 'package:golaundry/pages/widgets/total_payment.dart';
import '../../theme.dart';
import '../global/global.dart';
import '../models/pricing.dart';
import '../widgets/details.dart';
import '../widgets/error_dialog.dart';
import '../widgets/progress_bar.dart';
import 'package:intl/intl.dart';

class AddDetailsPage extends StatefulWidget {
  final String? id_laundry;
  final String? laundry_fare;
  final String? laundry_name;
  final Pricing priceMap = Pricing();
  // final Pricing? priceMap;
  AddDetailsPage({this.id_laundry, this.laundry_fare, this.laundry_name});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
  DateTime dateTime = DateTime.now();
  TextEditingController counterTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "ADD DETAILS",
            style: titlePageTextStyle,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: Color(0xff1A374D),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // actions: [
          //   StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          //       stream: FirebaseFirestore.instance
          //           .collection("admins")
          //           .doc(widget.id_laundry)
          //           .snapshots(),
          //       builder: (context, snapshot) {
          //         if (!snapshot.hasData) {
          //           return circularProgress();
          //         }
          //         return IconButton(
          //           icon: Icon(Icons.arrow_forward_ios_outlined),
          //           color: Color(0xff1A374D),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => SchedulePage(
          //                         id_laundry: snapshot.data?["id_laundry"],
          //                       )),
          //             );
          //           },
          //         );
          //       }),
          // ],
          elevation: 0,
          backgroundColor: Color(0xffB1D0E0),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("admins")
                      .doc(widget.id_laundry)
                      .snapshots(),
                  builder: (BuildContext, snapshot) {
                    return snapshot.hasData
                        ? Details(
                            item: '1 Kilogram',
                            price: "${snapshot.data?["price"]}",
                            // counter: snapshot.data?["tshirt"],
                          )
                        : SizedBox();
                  }),
              // SizedBox(
              //   height: 10,
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xffB1D0E0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Pickup Date",
                                  style: detailTitleFieldTextStyle,
                                ),
                                Text(
                                  DateFormat.yMMMMEEEEd().format(dateTime),
                                  style: detailSubtitleFieldTextStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 100,
                                height: 35,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xff406882),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  onPressed: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(Duration(days: 14)),
                                        builder: (context, child) => Theme(
                                              data: ThemeData().copyWith(
                                                colorScheme: ColorScheme.light(
                                                  primary: Color(0xff6998AB),
                                                ),
                                              ),
                                              child: child!,
                                            )).then((value) {
                                      if (value != null)
                                        setState(() {
                                          dateTime = value;
                                        });
                                    });
                                  },
                                  child: Icon(
                                    Icons.access_time,
                                    color: Color(0xffB1D0E0),
                                    size: 18,
                                  ),
                                ),
                              ),
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
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Email",
                                style: detailTitleFieldTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
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
                            .doc(sharedPreferences!.getString("uid"))
                            .collection("cust_address")
                            .doc(sharedPreferences!.getString("uid"))
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return circularProgress();
                          }
                          return Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration:
                                  BoxDecoration(color: Color(0xffB1D0E0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Address",
                                      style: detailTitleFieldTextStyle,
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 20),
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
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Payment",
                                style: detailTitleFieldTextStyle,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "cash of delivery",
                                  style: detailSubtitleFieldTextStyle,
                                ))
                          ],
                        ),
                      ),
                    ),
                    StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                        stream: FirebaseFirestore.instance
                            .collection("admins")
                            .doc(widget.id_laundry)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return circularProgress();
                          }
                          return Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Container(
                                  width: 267,
                                  height: 50,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xff406882),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                        ),
                                      ),
                                      onPressed: () {
                                        String id = DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString();
                                        final booking = Booking(
                                                id_cust: sharedPreferences!
                                                    .getString("uid"),
                                                id_laundry: widget.id_laundry,
                                                id_booking: id,
                                                cust_email: sharedPreferences!
                                                    .getString("email"),
                                                cust_address: sharedPreferences!
                                                    .getString("address"),
                                                pickup: DateFormat.yMMMMEEEEd()
                                                    .format(dateTime)
                                                    .toString(),
                                                laundry_name: snapshot
                                                    .data?["laundry_name"],
                                                laundry_fare: snapshot
                                                    .data?["laundry_fare"],
                                                price: snapshot.data?["price"],
                                                statusBook: "ongoing")
                                            .toJson();
                                        FirebaseFirestore.instance
                                            .collection("booking")
                                            .doc(id)
                                            .set(booking)
                                            .then((value) {
                                          showDialog(
                                              context: context,
                                              builder: (c) {
                                                return ErrorDialog(
                                                  message:
                                                      "booking has been saved.",
                                                );
                                              });
                                        });
                                      },
                                      child: Text("Place Order",
                                          style: buttonTextStyle))));
                        })
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
                      total:
                          "${snapshot.data?["laundry_fare"] + snapshot.data?["price"]}",
                    ));
              })
        ],
      ),
    );
  }
}
