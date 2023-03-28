import 'package:flutter/material.dart';
import 'package:worlds_time_app/pages/home.dart';
import 'package:worlds_time_app/pages/loading.dart';
import 'package:worlds_time_app/pages/choose_location.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
            '/':(context) =>Loading(),
          '/home':(context)=>Home(),
          '/location':(context)=>ChooseLocation(),
        },
      )
  );
}