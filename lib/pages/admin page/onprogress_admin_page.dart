// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/status_booking.dart';
import 'package:golaundry/theme.dart';
import '../global/global.dart';
import '../widgets/error_dialog.dart';

class OnprogressAdminPage extends StatefulWidget {
  const OnprogressAdminPage({Key? key, this.id_booking}) : super(key: key);
  final String? id_booking;
  @override
  State<OnprogressAdminPage> createState() => _OnprogressPageState();
}

class _OnprogressPageState extends State<OnprogressAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .where("id_laundry",
                  isEqualTo: sharedPreferences!.getString("uid"))
              .where("statusBook", isEqualTo: "ongoing")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'currently you dont have any order on progress',
                  style: noHistoryTextStyle,
                  textAlign: TextAlign.center,
                ),
              );
            }

            return ListView(
                children: snapshot.data!.docs.map((docs) {
              Map<String, dynamic> data = docs.data()! as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Card(
                  color: Color(0xffB1D0E0),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data["cust_email"],
                          style: bookingEmailTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data["cust_address"],
                          style: bookingAddressTextStyle,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Total: ",
                              style: bookingTotalTextStyle,
                            ),
                            Text(
                              "${data["laundry_fare"] + data["price"]}",
                              style: bookingEmailTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 48,
                                height: 21,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  onPressed: () async {
                                    // final statusBook = Status(
                                    //   statusBook: "accepted",
                                    // ).toJson();

                                    // FirebaseFirestore.instance
                                    //     .collection("booking")
                                    //     .doc("1656173690506")
                                    //     .update(statusBook)
                                    //     .then((value) {
                                    //   showDialog(
                                    //       context: context,
                                    //       builder: (c) {
                                    //         return ErrorDialog(
                                    //           message:
                                    //               "Booking status has been changed",
                                    //         );
                                    //       });
                                    // });
                                    // print("status: " + statusBook.toString());
                                  },
                                  child: Text(""),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                width: 48,
                                height: 21,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6))),
                                  onPressed: () {},
                                  child: Text(
                                    "",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList());
          }),
    );
  }
}
