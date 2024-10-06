import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/routes/routes.dart';
import 'package:travel/views/HomePage/state/homepageStateProvider.dart';
import 'package:travel/views/SplashScreen/splashscreen.dart';
import './constants/constants.dart';
import 'package:travel/views/HomePage/homepage.dart';
import './theme.dart';

import 'package:flutter_launcher_icons/abs/icon_generator.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/config/config.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/logger.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_generator.dart';
import 'package:flutter_launcher_icons/macos/macos_icon_template.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:flutter_launcher_icons/web/web_template.dart';
import 'package:flutter_launcher_icons/windows/windows_icon_generator.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext csontext) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomePageStateProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kHomePageTitle,
        theme: kAppTheme,
        initialRoute: AppRoutes.ROUTE_Initial,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}



