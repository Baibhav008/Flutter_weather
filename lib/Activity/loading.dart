import 'package:Weather/Worker/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String? temp;
  String? hum;
  String? airSpeed;
  String? desc;
  String? main;
  String? icon;



  String city="patna";




  Future<void>  getLocation() async
  {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks[0].locality.toString());
    city=placemarks[0].locality.toString();

  }


  Future<void> startApp(String city) async
  {

    worker instance = worker(location: city);
    await instance.getData();

    temp=instance.temp;
    hum=instance.humidity;
    airSpeed=instance.airSpeed;
    desc=instance.description;
    main=instance.main;
    icon=instance.icon;
    print(instance.description);



    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,'/home',arguments:{
        "temp_val":temp,
        "hum_val":hum,
        "airSpeed_val":airSpeed,
        "desc_val":desc,
        "main_val":main,
        "icon_val":icon,
        "city_val":city
      }
      );
    });



  }


  @override
  void initState() {
    // TODO: implement initState


  }

  @override
  Widget build(BuildContext context) {



    final Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search?.isNotEmpty??false)
    {
      city = search?['searchText'];
    }
    getLocation();
    startApp(city!);

    return Scaffold(

      body:
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 180,),
                  Image.asset("images/logo.png",height: 244,width:244 ,),
                  SizedBox(height: 20,),
                  Text("Mausam App",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 40,fontFamily: GoogleFonts.orbitron().fontFamily),),
                  SizedBox(height: 20,),
                  Text("Made by Baibhav",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: GoogleFonts.orbitron().fontFamily),),
                  SizedBox(height: 20,),
                  SpinKitSpinningLines
                    (
                    color: Colors.white,
                    size: 80.0,
                    itemCount: 8,
                  )

                ],
              ),

            ),
          ),

      backgroundColor: Colors.blue[400],
    );
  }
}
