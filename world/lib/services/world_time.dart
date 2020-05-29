import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime
{
  String location;
  String time;
  String flag;//url to an asset flag
  String url;

  bool day;
  String datee;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getData() async
  {
    try{
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data

      String datetime = data['datetime'];
  //    print(data);
      String offset = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);
      String offset3 = data['utc_datetime'].substring(0,10);
  //print(offset3);


      //create date time object

      DateTime now = DateTime.parse(datetime);

      now = now.add(
          Duration(hours: int.parse(offset), minutes: int.parse(offset2)));
      // print(now);

      day = now.hour>=6 && now.hour <20?true:false;
      time = DateFormat.jm().format(now);
      datee = offset3;
    }
    catch(e)
    {
      print(e);
    }
  }

}



