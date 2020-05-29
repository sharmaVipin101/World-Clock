import 'package:flutter/material.dart';
import 'package:world/pages/home.dart';
import 'package:world/pages/loading.dart';
import 'package:world/pages/location.dart';

void main() =>
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
        routes: {
      '/':(context) => Loading(),
          '/Home': (context)=>Home(),
          '/Location':(context) => Location(),
  },
  ));

