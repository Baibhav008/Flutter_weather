import 'dart:convert';
import 'package:http/http.dart' as http;

class worker
{

  worker({this.location})
  {
    location = this.location;
  }

  String? location;
  String? temp;
  String? humidity;
  String? airSpeed;
  String? description;
  String? main;

  Future<void> getData() async
  {
    try
    {
      final url = Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$location&appid=f62312887aeceeece315fa9df3587ae8');
      http.Response response = await http.get(url);
      Map data = jsonDecode(response.body);

      //FOR TEMP AND HUMIDITY
      Map mainData = data['main'];
      String gettemp=(mainData['temp']-273.15).toString();
      String gethumid = mainData['humidity'].toString();

      //FOR AIR SPEED
      Map wind = data['wind'];
      String getair_speed = wind['speed'].toString();

      //GETTING DESCRIPTION
      List weatherData = data['weather'];
      Map weatherDataMap = weatherData[0];
      String getmainDes = weatherDataMap['main'];
      String getdesc = weatherDataMap['description'];

      //ASSIGNING VALUES
      temp=gettemp.toString();
      humidity=gethumid.toString();
      airSpeed=getair_speed.toString();
      description=getdesc.toString();
      main=getmainDes;

    }catch(e)
    {
      temp="City not found";
      humidity="City not found";
      airSpeed="City not found";
      description="City not found";
      main="City not found";
    }


  }


}