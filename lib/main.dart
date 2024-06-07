import 'package:flutter/material.dart';
import 'package:mausam/Activity/home.dart';
import 'package:mausam/Activity/loading.dart';
import 'package:mausam/Activity/location.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context)=>Loading(),
        "/home":(context)=>Home(),
        "/location":(context)=>Location(),

      },
    )
  );
}
