import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/history_customer.dart';

class HistoryCustomerPage extends StatefulWidget {
  const HistoryCustomerPage({Key? key}) : super(key: key);

  @override
  State<HistoryCustomerPage> createState() => _HistoryCustomerPageState();
}

class _HistoryCustomerPageState extends State<HistoryCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: ListView(children: [HistoryCustomerCard()]),
    );
  }
}
