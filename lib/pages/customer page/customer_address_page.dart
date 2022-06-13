// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/assistant_method/address_changer.dart';
import 'package:golaundry/pages/customer%20page/customer_add_address_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/models/address.dart';
import 'package:golaundry/pages/widgets/address_design.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';
import 'package:provider/provider.dart';

class customerAddressPage extends StatefulWidget {
  @override
  State<customerAddressPage> createState() => _customerAddressPageState();
}

class _customerAddressPageState extends State<customerAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'DELIVERY ADDRESS',
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
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer<AddressChanger>(builder: (context, address, c) {
              return Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("customers")
                      .doc(sharedPreferences!.getString("uid"))
                      .collection("cust_address")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Center(
                            child: circularProgress(),
                          )
                        : snapshot.data!.docs.isEmpty
                            ? Container()
                            : ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return AddressDesign(
                                    selectedIndex: address.count,
                                    value: index,
                                    addressID: snapshot.data!.docs[index].id,
                                    model: Address.fromJson(
                                        snapshot.data!.docs[index].data()!
                                            as Map<String, dynamic>),
                                  );
                                },
                              );
                  },
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerAddAddressPage()),
                  );
                },
                icon: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("customers")
                        .doc(sharedPreferences!.getString("uid"))
                        .collection("cust_address")
                        .doc(sharedPreferences!.getString("uid"))
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!(snapshot).hasData) {
                        return Icon(
                          Icons.edit,
                          size: 40,
                          color: Color(0xffB1D0E0),
                        );
                        // Icon(
                        //   Icons.add_circle_rounded,
                        //   size: 40,
                        //   color: Color(0xffB1D0E0),
                        // );
                      }
                      return Icon(
                        Icons.edit,
                        size: 40,
                        color: Color(0xffB1D0E0),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
