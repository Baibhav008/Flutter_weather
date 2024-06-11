import 'dart:convert';
import 'dart:math';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:weather_icons/weather_icons.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController searchController = new TextEditingController();


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

    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    print(info);
    String temp = (info['temp_val']).toString();
    String speed = (info['airSpeed_val']).toString();
    if(temp!="")
      {
        temp=temp.substring(0,4);
        speed=speed.substring(0,4);
      }
    String humid = (info['hum_val']).toString();
    String desc =(info['desc_val']).toString();
    String mainDesc =(info['main_val']).toString();
    String icon = (info['icon_val']).toString();
    String cityReal = (info['city_val']).toString();

    var city_name = ["Patna", "Bangalore", "Mumbai", "Delhi"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: GradientAppBar(
          gradient: LinearGradient(colors: [Colors.cyanAccent, Colors.blue]),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.lightBlueAccent,
                  Colors.greenAccent,
                ])),
            child: Column(
              children: [
                Container(
                  //Search Container
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "")=="")
                            {
                              print("blank");
                            }
                          else
                            {
                              Navigator.pushReplacementNamed(context, "/loading",arguments:
                              {
                                "searchText":searchController.text
                              });
                            }
        
                        },
                        child: Container(
                            margin: EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            )),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search $city",
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.blue[800]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                Text(
                                  "$mainDesc",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.orbitron().fontFamily,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("In $cityReal",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.orbitron().fontFamily,
                                        fontSize: 20))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(14)),
                        padding: EdgeInsets.all(20),
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              WeatherIcons.thermometer,
                              size: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$temp",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.orbitron().fontFamily,
                                      fontSize: 74),
                                ),
                                Text(
                                  "°C",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.orbitron().fontFamily,
                                      fontSize: 34),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                          height: 210,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(14)),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(24, 0, 10, 0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    WeatherIcons.day_windy,
                                    size: 34,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "$speed",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.orbitron().fontFamily,
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("KMPH")
                            ],
                          )),
                    ),
                    Expanded(
                      child: Container(
                          height: 210,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(14)),
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(10, 0, 24, 0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    WeatherIcons.humidity,
                                    size: 34,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "$humid",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.orbitron().fontFamily,
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("%",style: TextStyle(fontFamily: GoogleFonts.orbitron().fontFamily,fontSize: 24),)
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by Baibhav",style: TextStyle(color: Colors.black,fontFamily: GoogleFonts.orbitron().fontFamily,fontSize: 16),),
                      Text("Data provided by Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
