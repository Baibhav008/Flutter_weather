import 'package:Weather/Activity/home.dart';
import 'package:Weather/Activity/loading.dart';
import 'package:Weather/Activity/location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=>Loading(),
        "/home":(context)=>Home(),
        "/location":(context)=>Location(),
        "/loading":(context)=>Loading()

      },
    )
  );
}
