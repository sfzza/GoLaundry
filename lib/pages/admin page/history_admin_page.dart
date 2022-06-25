import 'package:flutter/material.dart';
import 'package:golaundry/pages/widgets/history_admin.dart';

class historyAdminPage extends StatefulWidget {
  const historyAdminPage({Key? key}) : super(key: key);

  @override
  State<historyAdminPage> createState() => _historyAdminPageState();
}

class _historyAdminPageState extends State<historyAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6998AB),
      body: ListView(children: [HistoryAdminCard()]),
    );
  }
}
