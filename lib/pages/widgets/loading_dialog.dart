// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/progress_bar.dart';
import 'package:golaundry/theme.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;
  LoadingDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xffB1D0E0),
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          SizedBox(height: 10),
          Text(message! + ', please wait...')
        ],
      ),
    );
  }
}
