// ignore_for_file: curly_braces_in_flow_control_structures, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/checkout_page.dart';
import 'package:golaundry/pages/widgets/total_payment.dart';
import 'package:intl/intl.dart';
import '../../theme.dart';

import '../widgets/progress_bar.dart';

class SchedulePage extends StatefulWidget {
  // const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
  final String id_laundry;
  SchedulePage({required this.id_laundry});
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime dateTime = DateTime.now();
  // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  @override
  // Widget buildDateTimePicker() => SizedBox(
  //       height: 180,
  //       child: CupertinoDatePicker(
  //         initialDateTime: dateTime,
  //         mode: CupertinoDatePickerMode.dateAndTime,
  //         minimumDate: DateTime(DateTime.now().year, 2, 1),
  //         maximumDate: DateTime.now(),
  //         use24hFormat: true,
  //         onDateTimeChanged: (dateTime) =>
  //             setState(() => this.dateTime = dateTime),
  //       ),
  //     );
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff6998AB),
        appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "SCHEDULE",
              style: titlePageTextStyle,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              color: Color(0xff1A374D),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("admins")
                      .doc(widget.id_laundry)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return circularProgress();
                    }
                    return IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      color: Color(0xff1A374D),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckoutPage(
                                    id_laundry: snapshot.data?["id_laundry"],
                                  )),
                        );
                      },
                    );
                  }),
            ],
            elevation: 0,
            backgroundColor: Color(0xffB1D0E0),
          ),
          preferredSize: Size.fromHeight(80),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("admins")
                .doc(widget.id_laundry)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return circularProgress();
              }
              return Stack(children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(
                          "Your Schedule",
                          style: detailSubtitleFieldTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          DateFormat.yMMMMEEEEd().format(dateTime),
                          // dateTime.toString(),
                          style: detailTitleFieldTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 90),
                        child: Container(
                          width: 100,
                          height: 35,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xff406882),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate:
                                      DateTime.now().add(Duration(days: 14)),
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
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: TotalPayment(
                      total: "${snapshot.data?["laundry_fare"]}",
                    ))
              ]);
            })
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // buildDateTimePicker(),
        //       // const SizedBox(height: 24),
        //       ButtonWidget(
        //         onClicked: () => Utils.showSheet(
        //           context,
        //           child: buildDateTimePicker(),
        //           onClicked: () {
        //             final value = DateFormat('MM/dd/yyyy HH:mm').format(dateTime);
        //             Utils.showSnackBar(context, 'Selected "$value"');

        //             // Navigator.pop(context);
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
