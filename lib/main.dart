import 'package:flutter/material.dart';
import 'package:worldtimeapps/screens/base.dart';
import 'package:worldtimeapps/screens/places.dart';
import 'package:worldtimeapps/screens/running.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Running(),
      '/base': (context) => const Base(),
      '/places': (context) => const Places(),
    },
  ));
}