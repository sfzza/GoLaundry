// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/theme.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? message;
  final VoidCallback? function;
  ConfirmationDialog({required this.message, required this.function});

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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Cancel',
                  style: chatTitleTextStyle,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff406882),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                function!();
                Navigator.pop(context);
              },
              child: Center(
                child: Text(
                  'Yes',
                  style: chatTitleTextStyle,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff1A374D),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ],
    );
  }
}
