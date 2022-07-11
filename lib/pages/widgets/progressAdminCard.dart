// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/status_booking.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';

import 'error_dialog.dart';

class ProgressAdminCard extends StatefulWidget {
  // const ProgressAdminCard({Key? key}) : super(key: key);
  final String cust_email;
  final String cust_address;
  final String total;
  final String id_booking;
  ProgressAdminCard(
      {required this.cust_address,
      required this.cust_email,
      required this.total,
      required this.id_booking});
  @override
  State<ProgressAdminCard> createState() => _ProgressAdminCardState();
}

class _ProgressAdminCardState extends State<ProgressAdminCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("booking")
              .doc(widget.id_booking)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xffB1D0E0),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.cust_email,
                      style: bookingEmailTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.cust_address,
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
                          widget.total,
                          style: bookingEmailTextStyle,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          child: Container(
                            width: 112,
                            height: 35,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff406882),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              onPressed: () {
                                final statusBook = Status(
                                  statusBook: "rejected",
                                ).toJson();

                                FirebaseFirestore.instance
                                    .collection("booking")
                                    .doc(widget.id_booking)
                                    .update(statusBook)
                                    .then((value) {
                                  showDialog(
                                      context: context,
                                      builder: (c) {
                                        return ErrorDialog(
                                          message: "Status has been changed",
                                        );
                                      });
                                });
                                // print(widget.id_booking);
                                // print(statusBook);
                                // print(context);
                              },
                              child: Text(
                                "Reject",
                                style: chatTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 48),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            width: 112,
                            height: 35,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff6998AB),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              onPressed: () {
                                final statusBook = Status(
                                  statusBook: "accepted",
                                ).toJson();

                                FirebaseFirestore.instance
                                    .collection("booking")
                                    .doc(widget.id_booking)
                                    .update(statusBook)
                                    .then((value) {
                                  showDialog(
                                      context: context,
                                      builder: (c) {
                                        return ErrorDialog(
                                          message: "Status has been changed",
                                        );
                                      });
                                });
                                // print(widget.id_booking);
                                // print(statusBook);
                                // print(context);
                              },
                              child: Text(
                                "Accept",
                                style: chatTitleTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
