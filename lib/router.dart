// import 'package:flutter/material.dart';
// import 'package:golaundry/pages/customer%20page/customer_editprofile_page.dart';
// import 'package:golaundry/pages/authentication/views/customer_verification.dart.dart';

// import 'package:golaundry/pages/userlevel_page.dart';

// import 'pages/customer page/customer_address_page.dart';
// import 'pages/customer page/customer_page.dart';
// import 'pages/customer page/customer_payment_page.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(builder: (_) => UserLevelPage());
//       case '/custverification':
//         return MaterialPageRoute(builder: (_) => customerVerificationPage());
//       case '/customerpage':
//         return MaterialPageRoute(builder: (_) => customerPage());
//       case '/custeditprofilepage':
//         return MaterialPageRoute(builder: (_) => customerEditProfilePage());
//       case '/custaddresspage':
//         return MaterialPageRoute(builder: (_) => customerAddressPage());
//       case '/custpaymentpage':
//         return MaterialPageRoute(builder: (_) => customerPaymentPage());
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('ERROR'),
//         ),
//         body: Center(
//           child: Text('Error Page'),
//         ),
//       );
//     });
//   }
// }
