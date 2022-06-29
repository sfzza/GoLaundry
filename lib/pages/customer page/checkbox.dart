// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golaundry/pages/models/tags.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import '../../theme.dart';
import '../global/global.dart';
import '../widgets/error_dialog.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? _myActivities;
  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      // form.save();
      final tags = Tags(
        tags: _myActivities,
      ).toJson();

      FirebaseFirestore.instance
          .collection("admins")
          .doc(currentFirebaseUser!.uid)
          .update(tags)
          .then((value) {
        // showDialog(
        //     context: context,
        //     builder: (c) {
        //       return ErrorDialog(
        //         message: "pricing has been saved.",
        //       );
        //     });
      });
      // print(_myActivitiesResult);
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiSelect Formfield Example'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: MultiSelectFormField(
                  autovalidate: AutovalidateMode.disabled,
                  chipBackGroundColor: Color(0xff6998AB),
                  fillColor: Color(0xffB1D0E0),
                  chipLabelStyle: chatTitleTextStyle,
                  dialogTextStyle: checkBoxTextStyle,
                  checkBoxActiveColor: Color(0xff406882),
                  checkBoxCheckColor: Color(0xffB1D0E0),
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text("Laundry Tags", style: bookingStatusTextStyle),
                  validator: (value) {
                    if (value == null || value.length == 0) {
                      return 'Please select one or more options';
                    }
                    return null;
                  },
                  dataSource: [
                    {
                      "display": "Dry Cleaning",
                      "value": "dry",
                    },
                    {
                      "display": "Wash",
                      "value": "wash",
                    },
                    {
                      "display": "Iron",
                      "value": "iron",
                    },
                    {
                      "display": "Wash and Iron",
                      "value": "washniron",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: const Text('Please choose one or more'),
                  initialValue: _myActivities,
                  onSaved: (value) {
                    if (value == null) return;
                    setState(() {
                      _myActivities = value;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                    child: const Text('Save'), onPressed: _saveForm),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(_myActivitiesResult),
              )
            ],
          ),
        ),
      ),
    );
  }
}
