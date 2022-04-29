import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 12),
    child: const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Color(0xff1A374D))),
  );
}
