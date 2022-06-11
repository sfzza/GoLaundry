// ignore_for_file: non_constant_identifier_names, prefer_collection_literals, unnecessary_new, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';

class Laundries {
  String? id_laundry;
  String? laundry_email;
  String? laundry_name;
  String? laundry_address;

  Laundries(
      {this.id_laundry,
      this.laundry_name,
      this.laundry_email,
      this.laundry_address});

  // factory Laundries.fromJson(DocumentSnapshot snapshot) {
  //   return Laundries(
  //       id_laundry: snapshot.id,
  //       laundry_name: snapshot["laundry_name"],
  //       laundry_email: snapshot["laundry_email"],
  //       laundry_address: snapshot["laundry_address"]);
  // }
// }

  Laundries.fromJson(Map<String, dynamic> json) {
    id_laundry = json["id_laundry"];
    laundry_name = json["laundry_name"];
    laundry_email = json["laundry_email"];
    laundry_address = json["laundry_address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_laundry"] = this.id_laundry;
    data["laundry_name"] = this.laundry_name;
    data["laundry_email"] = this.laundry_email;
    data["laundry_address"] = this.laundry_address;
    return data;
  }
}
