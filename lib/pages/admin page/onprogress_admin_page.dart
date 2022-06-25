// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/progressAdminCard.dart';
import 'package:golaundry/theme.dart';

class OnprogressAdminPage extends StatefulWidget {
  const OnprogressAdminPage({Key? key}) : super(key: key);

  @override
  State<OnprogressAdminPage> createState() => _OnprogressPageState();
}

class _OnprogressPageState extends State<OnprogressAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: ListView(children: [ProgressAdminCard()]),
    );
  }
}
