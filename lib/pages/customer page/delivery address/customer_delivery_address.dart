// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/assistant_method/address_changer.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';
import 'package:provider/provider.dart';

import '../../models/deliv_address.dart';
import 'customer_add_delivery_address.dart';
import 'deliv_address_design.dart';

class customerAddressDeliveryPage extends StatefulWidget {
  @override
  State<customerAddressDeliveryPage> createState() =>
      _customerAddressDeliveryPageState();
}

class _customerAddressDeliveryPageState
    extends State<customerAddressDeliveryPage> {
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
      body: Stack(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 6,
                ),
                Consumer<AddressChanger>(builder: (context, address, c) {
                  return Flexible(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("customers")
                          .doc(sharedPreferences!.getString("uid"))
                          .collection("deliv_address")
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
                                      return DelivAddressDesign(
                                        selectedIndex: address.count,
                                        value: index,
                                        // addressID:
                                        //     snapshot.data!.docs[index].id,
                                        model: DelivAddress.fromJson(
                                            snapshot.data!.docs[index].data()!
                                                as Map<String, dynamic>),
                                      );
                                    },
                                  );
                      },
                    ),
                  );
                }),
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
              return Positioned(
                bottom: 50,
                right: 50,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerAddDelivAddressPage()),
                    );
                  },
                  minWidth: 70,
                  height: 70,
                  padding: EdgeInsets.all(5),
                  color: Color(0xffB1D0E0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.edit,
                    color: Color(0xff406882),
                    size: 40,
                  ),
                ),
              );
            }),
      ]),
    );
  }
}
