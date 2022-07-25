// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/pages/widgets/loading_dialog.dart';

createPricing(
    {context,
    id_laundry,
    id_cust,
    tshirt,
    dress,
    bottom,
    underclothes,
    jeans,
    bag,
    shoes,
    bedsheet,
    blanket}) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return LoadingDialog(message: "Processing");
      });
  final User? firebaseUser = currentFirebaseUser;
  if (firebaseUser != null) {
    Map<String, dynamic> pricingMap = {
      "id_laundry": firebaseUser.uid,
      "id_cust": id_cust,
      "tshirt": tshirt.trim(),
      "dress": dress.trim(),
      "bottom": bottom.trim(),
      "underclothes": underclothes.trim(),
      "jeans": jeans.trim(),
      "bag": bag.trim(),
      "shoes": shoes.trim(),
      "bedsheet": bedsheet.trim(),
      "blanket": blanket.trim(),
    };
    FirebaseFirestore.instance
        .collection("admins")
        .doc(sharedPreferences!.getString("uid"))
        .collection("pricing")
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(pricingMap)
        .then((c) {
      return ErrorDialog(message: "Pricing has been saved.");
    });
  } else {
    ErrorDialog(message: "Pricing has not been saved.");
  }
}

updateBookingStatus({
  status,
  id_booking,
}) async {
  Map<String, dynamic> updateBookingStatusMap = {
    "status": status,
  };

  FirebaseFirestore.instance
      .collection("booking")
      .doc(id_booking)
      .update(updateBookingStatusMap);

  // Fluttertoast.showToast(msg: "Updated");
  // Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (c) => const ScheduleTabPage()),
  //     (Route<dynamic> route) => route.isFirst);
}
