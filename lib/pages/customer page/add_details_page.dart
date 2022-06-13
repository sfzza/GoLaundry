// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/customer%20page/schdedule_page.dart';
import 'package:golaundry/pages/widgets/total_payment.dart';
import '../../theme.dart';
import '../models/pricing.dart';
import '../widgets/details.dart';
import '../widgets/progress_bar.dart';

class AddDetailsPage extends StatefulWidget {
  final String? id_laundry;
  final String? id_price;
  final Pricing priceMap = Pricing();
  // final Pricing? priceMap;
  AddDetailsPage({this.id_laundry, this.id_price});

  @override
  State<AddDetailsPage> createState() => _AddDetailsPageState();
}

class _AddDetailsPageState extends State<AddDetailsPage> {
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
                            builder: (context) => SchedulePage(
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
      body: Stack(
        children: [
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection("admins")
                  .doc(widget.id_laundry)
                  .collection("pricing")
                  .doc(widget.id_laundry)
                  .snapshots(),
              builder: (BuildContext, snapshot) {
                return snapshot.hasData
                    ? ListView(
                        children: [
                          Details(
                            item: 'Tshirt',
                            price: "${snapshot.data?["tshirt"]}",
                          ),
                          Details(
                            item: 'Dress',
                            price: "${snapshot.data?["dress"]}",
                          ),
                          Details(
                            item: 'Bottom',
                            price: "${snapshot.data?["bottom"]}",
                          ),
                          Details(
                            item: 'Underclothes',
                            price: "${snapshot.data?["underclothes"]}",
                          ),
                          Details(
                            item: 'Jeans',
                            price: "${snapshot.data?["jeans"]}",
                          ),
                          Details(
                            item: 'Bag',
                            price: "${snapshot.data?["bag"]}",
                          ),
                          Details(
                            item: 'Shoes',
                            price: "${snapshot.data?["shoes"]}",
                          ),
                          Details(
                            item: 'Bed Sheet',
                            price: "${snapshot.data?["bedsheet"]}",
                          ),
                          Details(
                            item: 'Blanket',
                            price: "${snapshot.data?["blanket"]}",
                          ),
                          SizedBox(
                            height: 130,
                          )
                        ],
                      )
                    : SizedBox();
              }),
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
                      total: "${snapshot.data?["laundry_fare"]} ",
                    ));
              })
        ],
      ),
    );
  }
}
