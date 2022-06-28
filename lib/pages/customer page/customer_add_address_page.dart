// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/models/address.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/pages/widgets/text_field.dart';
import 'package:golaundry/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerAddAddressPage extends StatefulWidget {
  @override
  State<CustomerAddAddressPage> createState() => _CustomerAddAddressPageState();
}

class _CustomerAddAddressPageState extends State<CustomerAddAddressPage> {
  final formKey = GlobalKey<FormState>();
  final _flatNumber = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _locationController = TextEditingController();
  final _completeAddress = TextEditingController();

  Position? position;
  List<Placemark>? placeMarks;

  getCustLocationAddress() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    position = newPosition;

    placeMarks = await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );

    Placemark pMark = placeMarks![0];

    String fullAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    _locationController.text = fullAddress;

    _flatNumber.text =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}';
    _city.text =
        '${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}';
    _state.text = '${pMark.country}';
    _completeAddress.text = fullAddress;
  }

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
      body: Padding(
        padding: const EdgeInsets.only(top: 21, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                      controller: _completeAddress,
                      cursorColor: Color(0xff1A374D),
                      decoration: InputDecoration(
                        hintText: "Enter Address",
                        hintStyle: hintTextStyle,
                        fillColor: Color(0xffB1D0E0),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff406882), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide:
                                BorderSide(color: Color(0xff1A374D), width: 3)),
                      ),
                      style: textFieldTextStyle),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          hint: 'City',
                          controller: _city,
                        ),
                        MyTextField(
                          hint: 'State / Country',
                          controller: _state,
                        ),
                        MyTextField(
                          hint: 'Address Line',
                          controller: _flatNumber,
                        ),
                        MyTextField(
                          hint: 'Complete Address',
                          controller: _completeAddress,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 400,
                  height: 40,
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      getCustLocationAddress();
                      // print('${position}');
                    },
                    child: Text('get my current location'),
                    style: ElevatedButton.styleFrom(primary: Color(0xff2C88D9)),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Container(
                  width: 360,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff406882),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    onPressed: () {
                      final model = Address(
                        state: _state.text.trim(),
                        fullAddress: _completeAddress.text.trim(),
                        flatNumber: _flatNumber.text.trim(),
                        city: _city.text.trim(),
                        lat: position!.latitude,
                        lng: position!.longitude,
                      )
                          // status: "unselected")
                          .toJson();

                      FirebaseFirestore.instance
                          .collection("customers")
                          .doc(sharedPreferences!.getString("uid"))
                          // .collection("cust_address")
                          // .doc(sharedPreferences!.getString("uid"))
                          .update(model)
                          .then((value) async {
                        showDialog(
                            context: context,
                            builder: (c) {
                              return ErrorDialog(
                                message: "new address has been saved.",
                              );
                            });
                        sharedPreferences =
                            await SharedPreferences.getInstance();
                        await sharedPreferences!
                            .setDouble("lat", position!.latitude);
                        await sharedPreferences!
                            .setDouble("lng", position!.longitude);
                        await sharedPreferences!
                            .setString("address", _completeAddress.text.trim());
                        // formKey.currentState!.reset();
                      });
                      FirebaseFirestore.instance
                          .collection("customers")
                          .doc(sharedPreferences!.getString("uid"))
                          .collection("cust_address")
                          .doc(sharedPreferences!.getString("uid"))
                          .set(model)
                          .then((value) async {});
                    },
                    child: Text(
                      'save the address',
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
