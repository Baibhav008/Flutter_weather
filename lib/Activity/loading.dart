import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam/Worker/worker.dart';
import 'package:google_fonts/google_fonts.dart';

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





  Future<void> startApp() async
  {
    worker instance = worker(location: "Patna");
    await instance.getData();

    temp=instance.temp;
    hum=instance.humidity;
    airSpeed=instance.airSpeed;
    desc=instance.description;
    main=instance.main;
    print(instance.description);

    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,'/home',arguments:{
        "temp_val":temp,
        "hum_val":hum,
        "airSpeed_val":airSpeed,
        "desc_val":desc,
        "main_val":main
      }
      );
    });



  }


  @override
  void initState() {
    // TODO: implement initState
    startApp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
      backgroundColor: Colors.blue[400],
    );
  }
}
