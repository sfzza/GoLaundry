// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class ErrorDialog extends StatelessWidget {
  final String? message;
  ErrorDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffB1D0E0),
      key: key,
      content: Text(
        message!,
        style: selectedNavLaundryTextStyle,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Text(
              'OK',
              style: chatTitleTextStyle,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xff1A374D),
          ),
        ),
      ],
    );
  }
}
