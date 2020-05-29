import 'package:flutter/material.dart';
import 'package:world/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

//  void getData() async
//  {
////    await Future.delayed(Duration(seconds: 3),(){
////      print("welcome back");
////    }); we can also fetch/return like below
//
////    String x  = await Future.delayed(Duration(seconds: 3),(){
////      return 'vipin';
////    });
////
////
////    Future.delayed(Duration(seconds: 3),(){
////      print("welcome back");
////    });
////
////    print("hello");
////
////    print('$x');
//
////  Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
////
////  Map data = jsonDecode(response.body);
////  print(data);
////  print(data['title']);
//
//  Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
//  Map data = jsonDecode(response.body);
//  //print(data);
//
//    //get properties from data
//
//    String datetime = data['datetime'];
//    String offset = data['utc_offset'].substring(1,3);
//  String offset2 = data['utc_offset'].substring(4,6);
////    print(datetime);
//  //  print(offset);
//
//  //create date time object
//
//    DateTime now = DateTime.parse(datetime);
//
//    now = now.add(Duration(hours: int.parse(offset), minutes: int.parse(offset2)));
//    print(now);
//
//  }
//String time = 'loading';
void setupWorldTime () async
{
 WorldTime q = WorldTime(location: 'India',flag: 'in.png',url: 'Asia/kolkata');
 await q.getData();
 Navigator.pushReplacementNamed(context, '/Home',arguments:
 {
   'location':q.location,
   'flag':q.flag,
   'time':q.time,
   'day':q.day,
   'datee':q.datee,

 });
// print(q.time);
// setState(() {
//   time = q.time;
// });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(

        child:SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),

      )
    );
  }
}
