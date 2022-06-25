import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/onprogress_customer.dart';

class OnprogressCustomerPage extends StatefulWidget {
  const OnprogressCustomerPage({Key? key}) : super(key: key);

  @override
  State<OnprogressCustomerPage> createState() => _OnprogressCustomerPageState();
}

class _OnprogressCustomerPageState extends State<OnprogressCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: ListView(children: [OnprogressCustomerCard()]),
    );
  }
}
