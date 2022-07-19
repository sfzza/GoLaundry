// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/deliv_address.dart';

class CustomerAddDelivAddressPage extends StatefulWidget {
  @override
  State<CustomerAddDelivAddressPage> createState() =>
      _CustomerAddDelivAddressPageState();
}

class _CustomerAddDelivAddressPageState
    extends State<CustomerAddDelivAddressPage> {
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
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
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1.5, 1.5),
                          blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
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
                      final model = DelivAddress(
                        delivState: _state.text.trim(),
                        delivAddress: _completeAddress.text.trim(),
                        delivFlatNumber: _flatNumber.text.trim(),
                        delivCity: _city.text.trim(),
                        delivLat: position!.latitude,
                        delivLng: position!.longitude,
                      )
                          // status: "unselected")
                          .toJson();

                      FirebaseFirestore.instance
                          .collection("customers")
                          .doc(sharedPreferences!.getString("uid"))
                          .update(model)
                          .then((value) async {
                        showDialog(
                            context: context,
                            builder: (c) {
                              return ErrorDialog(
                                message: "new address has been saved.",
                              );
                            });
                        // Navigator.pop(context);
                        sharedPreferences =
                            await SharedPreferences.getInstance();
                        await sharedPreferences!
                            .setDouble("delivLat", position!.latitude);
                        await sharedPreferences!
                            .setDouble("delivLng", position!.longitude);
                        await sharedPreferences!.setString(
                            "delivAddress", _completeAddress.text.trim());
                        // formKey.currentState!.reset();
                      });
                      FirebaseFirestore.instance
                          .collection("customers")
                          .doc(sharedPreferences!.getString("uid"))
                          .collection("deliv_address")
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
