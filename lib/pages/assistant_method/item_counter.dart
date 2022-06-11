import 'package:flutter/material.dart';
import 'package:golaundry/pages/global/global.dart';

class ItemCounter extends ChangeNotifier {
  int listItemCounter = sharedPreferences!.getStringList("booking")!.length - 1;
  int get count => listItemCounter;

  Future<void> displayListItemNumber() async {
    listItemCounter = sharedPreferences!.getString("booking")!.length - 1;

    await Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }
}
