import 'package:flutter/material.dart';
import 'package:flutter_listview_app/constant/Constant.dart';
import 'package:flutter_listview_app/screen/CalendarApp.dart';
import 'package:flutter_listview_app/screen/HomeScreen.dart';
import 'package:flutter_listview_app/screen/SplashScreen.dart';
import 'package:flutter_listview_app/screen/FormWidgets.dart';
import 'package:flutter_listview_app/screen/GoogleMaps.dart';

void main() => runApp(
      MaterialApp(
        title: 'MobileEyes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue[800],
        ),
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
          HOME_SCREEN: (BuildContext context) => HomeScreen(),
          FORM_WIDGETS: (BuildContext context) => FormWidgets(),
          "GOOGLE_MAPS": (BuildContext context) => GoogleMaps(),
          "CALENDAR_SCREEN": (BuildContext context) => CalendarApp(),
        },
      ),
    );
