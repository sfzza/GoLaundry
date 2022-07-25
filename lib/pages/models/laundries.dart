// ignore_for_file: non_constant_identifier_names, prefer_collection_literals, unnecessary_new, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';

class Laundries {
  String? id_laundry;
  String? laundry_email;
  String? laundry_name;
  String? laundry_address;
  int? laundry_fare;
  String? laundry_hour;
  String? laundry_password;
  String? laundry_phone;
  int? price;
  int? lat;
  int? lng;
  String? status;

  Laundries(
      {this.id_laundry,
      this.laundry_name,
      this.laundry_email,
      this.laundry_address,
      this.lat,
      this.laundry_fare,
      this.laundry_hour,
      this.laundry_password,
      this.laundry_phone,
      this.lng,
      this.price,
      this.status});

  Laundries.fromSnapshot(snapshot)
      : id_laundry = snapshot.data()["id_laundry"],
        laundry_name = snapshot.data()["laundry_name"],
        laundry_email = snapshot.data()["laundry_email"],
        laundry_address = snapshot.data()["laundry_address"],
        lat = snapshot.data()["lat"],
        laundry_fare = snapshot.data()["laundry_fare"],
        laundry_hour = snapshot.data()["laundry_hour"],
        lng = snapshot.data()["lng"],
        price = snapshot.data()["prie"],
        status = snapshot.data()["status"],
        laundry_password = snapshot.data()["laundry_password"],
        laundry_phone = snapshot.data()["laundry_phone"];

  Laundries.fromJson(Map<String, dynamic> json) {
    id_laundry = json["id_laundry"];
    laundry_name = json["laundry_name"];
    laundry_email = json["laundry_email"];
    laundry_address = json["laundry_address"];
    lat = json["lat"];
    laundry_fare = json["laundry_fare"];
    laundry_hour = json["laundry_hour"];
    lng = json["lng"];
    price = json["price"];
    status = json["status"];
    laundry_password = json["laundry_password"];
    laundry_phone = json["laundry_phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id_laundry"] = this.id_laundry;
    data["laundry_name"] = this.laundry_name;
    data["laundry_email"] = this.laundry_email;
    data["laundry_address"] = this.laundry_address;
    data["lat"] = this.lat;
    data["laundry_fare"] = this.laundry_fare;
    data["laundry_hour"] = this.laundry_hour;
    data["lng"] = this.lng;
    data["price"] = this.price;
    data["status"] = this.status;
    data["laundry_password"] = this.laundry_password;
    data["laundry_phone"] = this.laundry_phone;
    return data;
  }
}
