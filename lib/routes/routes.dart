import 'package:flutter/material.dart';
import 'package:travel/views/HomePage/homepage.dart';
import 'package:travel/views/Login/userCreate.dart';
import 'package:travel/views/SplashScreen/splashscreen.dart';
import 'package:travel/views/ViewDetails/viewDetails.dart';

import 'package:travel/views/Login/login.dart';

class AppRoutes {
  static const String ROUTE_Initial = ROUTE_Splashscreen;

  static const String ROUTE_Home = "/home";
  static const String ROUTE_Splashscreen = "/splash";
  static const String ROUTE_ViewDetails = "/view";
  static const String ROUTE_Login = "/login";
  static const String ROUTE_CreateAccount = "/createAccount";
  //static const String ROUTE_Login = "/login";
 // static const String ROUTE_Login = "/login";

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_Home:
        return MaterialPageRoute(settings: settings, builder: (_) => HomePage());
      case ROUTE_Splashscreen:
        return MaterialPageRoute(settings: settings, builder: (_) => SplashScreen());
      case ROUTE_ViewDetails:
        return MaterialPageRoute(settings: settings, builder: (_) => ViewDetails());
      case ROUTE_Login:
        return MaterialPageRoute(settings: settings, builder: (_) => Login());
      case ROUTE_CreateAccount:
        return MaterialPageRoute(settings: settings, builder: (_) => CreateAccountScreen());
      default:
        return MaterialPageRoute(builder: (_) => Text('Error!')); // Handle unknown routes
    }
  }
}
