import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    print("Initial state");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // We retrive data passed by loading screen inside widget because it provides context

    Map info= ModalRoute.of(context)!.settings.arguments as Map;


    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          title: Text(
            "Home Activity",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            FloatingActionButton(
                onPressed: (){}),Text(info["main_val"])
          ],
        ));
  }
}
