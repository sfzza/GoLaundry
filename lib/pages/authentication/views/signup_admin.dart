import 'dart:async';
// import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:golaundry/pages/admin%20page/admin_page.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/widgets/error_dialog.dart';
import 'package:golaundry/pages/widgets/loading_dialog.dart';
import 'package:golaundry/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart' as fStorage;
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../admin page/pricing_page.dart';

class adminSignup extends StatefulWidget {
  const adminSignup({Key? key}) : super(key: key);

  @override
  State<adminSignup> createState() => _adminSignupState();
}

class _adminSignupState extends State<adminSignup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  // TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  TextEditingController operationHourTextEditingController =
      TextEditingController();
  TextEditingController fareTextEditingController = TextEditingController();
  TextEditingController priceTextEditingController = TextEditingController();

  // XFile? imageXFile;
  // final ImagePicker _picker = ImagePicker();

  Position? position;
  List<Placemark>? placeMarks;

  // String laundryImageUrl = "";
  String completeAddress = "";

  // Future<void> _getImage() async {
  //   imageXFile = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     imageXFile;
  //   });
  // }

  getCurrentLocation() async {
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

    completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    locationTextEditingController.text = completeAddress;
  }

  // Future<void> validateForm() async {
  //   if (imageXFile == null) {
  //     showDialog(
  //         context: context,
  //         builder: (c) {
  //           return ErrorDialog(
  //             message: "Please select an image.",
  //           );
  //         });
  //   } else {
  //     if (passwordTextEditingController.text ==
  //         confirmPasswordController.text) {
  //       if (confirmPasswordController.text.isNotEmpty &&
  //           emailTextEditingController.text.isNotEmpty &&
  //           nameTextEditingController.text.isNotEmpty &&
  //           phoneTextEditingController.text.isNotEmpty &&
  //           locationTextEditingController.text.isNotEmpty) {
  //         //start uploading image
  //         showDialog(
  //             context: context,
  //             builder: (c) {
  //               return LoadingDialog(
  //                 message: "Registering Account",
  //               );
  //             });

  //         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //         fStorage.Reference reference = fStorage.FirebaseStorage.instance
  //             .ref()
  //             .child("admins")
  //             .child(fileName);
  //         fStorage.UploadTask uploadTask =
  //             reference.putFile(File(imageXFile!.path));
  //         fStorage.TaskSnapshot taskSnapshot =
  //             await uploadTask.whenComplete(() {});
  //         await taskSnapshot.ref.getDownloadURL().then((url) {
  //           laundryImageUrl = url;

  //           //save info to firestore
  //           saveAdminInfoNow();
  //         });
  //       } else {
  //         showDialog(
  //             context: context,
  //             builder: (c) {
  //               return ErrorDialog(
  //                 message:
  //                     "Please write the complete required info for Registration.",
  //               );
  //             });
  //       }
  //     } else {
  //       showDialog(
  //           context: context,
  //           builder: (c) {
  //             return ErrorDialog(
  //               message: "Password do not match.",
  //             );
  //           });
  //     }
  //   }
  // }

  Future<void> validateForm() async {
    if (nameTextEditingController.text.length < 3) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Name must be more than 3 characters');
          });
    } else if (!emailTextEditingController.text.contains('@')) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter an email address!');
          });
    } else if (phoneTextEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter phone number!');
          });
    } else if (passwordTextEditingController.text.length < 6) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
                message: 'Password must be atleast 6 characters!');
          });
    } else if (fareTextEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter fare per 1 KM!');
          });
    } else if (operationHourTextEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter operation hour!');
          });
    } else if (locationTextEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter an address!');
          });
    } else if (priceTextEditingController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: 'Please enter the price!');
          });
    } else {
      saveAdminInfoNow();
      LoadingDialog(message: 'make an account');
    }
  }

  void saveAdminInfoNow() async {
    User? currentUser;

    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: error.message.toString(),
            );
          });
    });

    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        Route newRoute = MaterialPageRoute(builder: (c) => AdminPage());
        Navigator.pushReplacement(context, newRoute);
      });
    }
  }

  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection("admins").doc(currentUser.uid).set({
      "id_laundry": currentUser.uid,
      "laundry_email": currentUser.email,
      "laundry_name": nameTextEditingController.text.trim(),
      // "laundryImageUrl": laundryImageUrl,
      "laundry_phone": phoneTextEditingController.text.trim(),
      "laundry_password": passwordTextEditingController.text.trim(),
      "laundry_address": completeAddress,
      "laundry_fare": int.parse(fareTextEditingController.text),
      "laundry_hour": operationHourTextEditingController.text.trim(),
      "price": int.parse(
        priceTextEditingController.text.trim(),
      ),
      "lat": position!.latitude,
      "lng": position!.longitude,
      // "laundry_tags": ['garbageValue'],
      "status": "approved",
    });
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("email", currentUser.email.toString());
    await sharedPreferences!
        .setString("name", nameTextEditingController.text.trim());
    await sharedPreferences!
        .setString("address", locationTextEditingController.text.trim());

    // await sharedPreferences!.setString("status", "admin");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 30.0, bottom: 40),
            child: Text(
              'Join GoLaundry',
              style: titleTextStyle,
            ),
          ),
          // Center(
          //   child: InkWell(
          //     onTap: () {
          //       _getImage();
          //     },
          //     child: CircleAvatar(
          //       radius: 60,
          //       backgroundColor: Colors.white,
          //       backgroundImage: imageXFile == null
          //           ? null
          //           : FileImage(File(imageXFile!.path)),
          //       child: imageXFile == null
          //           ? Image.asset(
          //               "assets/upload_pict.png",
          //               height: 70,
          //             )
          //           : null,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: 54,
              right: 54,
            ),
            child: TextFormField(
                autocorrect: false,
                controller: emailTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Email Address",
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
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                autocorrect: false,
                controller: nameTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Laundry Name",
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
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: phoneTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Phone Number",
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
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s'))
                ],
                autocorrect: false,
                controller: passwordTextEditingController,
                cursorColor: Color(0xff1A374D),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
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
          // SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 54, right: 54),
          //   child: TextFormField(
          //       controller: confirmPasswordController,
          //       cursorColor: Color(0xff1A374D),
          //       obscureText: true,
          //       decoration: InputDecoration(
          //         hintText: "Confirm Password",
          //         hintStyle: hintTextStyle,
          //         fillColor: Color(0xffB1D0E0),
          //         filled: true,
          //         enabledBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(3),
          //             borderSide:
          //                 BorderSide(color: Color(0xff406882), width: 3)),
          //         focusedBorder: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(3),
          //             borderSide:
          //                 BorderSide(color: Color(0xff1A374D), width: 3)),
          //       ),
          //       style: textFieldTextStyle),
          // ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                autocorrect: false,
                controller: fareTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Fare Laundry",
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
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                autocorrect: false,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: priceTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Price per 1 Kg",
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
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                autocorrect: false,
                controller: operationHourTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Operation hour e.g. 08:00 - 20:00",
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
            padding: const EdgeInsets.only(left: 54, right: 54),
            child: TextFormField(
                autocorrect: false,
                controller: locationTextEditingController,
                cursorColor: Color(0xff1A374D),
                decoration: InputDecoration(
                  hintText: "Laundry Location",
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
            height: 11,
          ),
          Container(
            width: 400,
            height: 40,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                getCurrentLocation();
                // print('${position}');
              },
              child: Text('Get my current location'),
              style: ElevatedButton.styleFrom(primary: Color(0xff2C88D9)),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 49),
              child: Container(
                width: 267,
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff406882),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: () {
                    validateForm();
                  },
                  child: Text(
                    'Sign Up',
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
