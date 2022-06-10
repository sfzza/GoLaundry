// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 42), primary: Color(0xff406882)),
        child: Text(
          'Pick Schedule',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}
