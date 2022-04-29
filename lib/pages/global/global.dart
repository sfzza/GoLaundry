import 'package:firebase_auth/firebase_auth.dart';
import 'package:golaundry/pages/models/laundries.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
User? currentFirebaseUser;
SharedPreferences? sharedPreferences;
