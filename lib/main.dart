import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:golaundry/pages/assistant_method/address_changer.dart';
import 'package:golaundry/pages/global/global.dart';
import 'package:golaundry/pages/splash%20screen/splash_screen.dart';
import 'package:golaundry/pages/userlevel_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => AddressChanger()),
      ],
      child: const MaterialApp(
        title: 'golaundry mobile app',
        debugShowCheckedModeBanner: false,
        home:
            // UserLevelPage()
            MySplashScreen(),
      ),
    );
  }
}
