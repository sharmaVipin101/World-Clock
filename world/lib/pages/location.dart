import 'package:flutter/material.dart';
import 'package:world/services/world_time.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> location = [
    WorldTime(url:'America/New_York',location:'America',flag:'us.png'),
    WorldTime(url:'America/Argentina/Buenos_Aires',location:'Argentina',flag:'a.png'),
    WorldTime(url:'Australia/Sydney',location:'Australia',flag:'aus.png'),
    WorldTime(url:'America/Rio_Branco',location:'Brazil',flag:'b.png'),
    WorldTime(url:'America/Toronto',location:'Canada',flag:'cn.png'),
    WorldTime(url:'Asia/Hong_Kong',location:'China',flag:'ch.png'),
    WorldTime(url:'America/Santiago',location:'Chile',flag:'c.png'),
    WorldTime(url:'Europe/Paris',location:'France',flag:'fr.png'),
    WorldTime(url:'Asia/kolkata',location:'India',flag:'in.png'),
    WorldTime(url:'Asia/Jakarta',location:'Indonesia',flag:'indo.png'),
    WorldTime(url:'Africa/Johannesburg',location:'South Africa',flag:'sa.png'),
    WorldTime(url:'Asia/Karachi',location:'Karachi',flag:'pk.png'),
    WorldTime(url:'America/Mexico_City',location:'Mexico_City',flag:'m.png'),
    WorldTime(url:'Asia/Seoul',location:'Seoul',flag:'jp.png'),
    WorldTime(url:'Asia/Kathmandu',location:'Nepal',flag:'np.png'),
    WorldTime(url:'Europe/London',location:'United Kingdom',flag:'uk.png'),
    WorldTime(url:'Europe/Madrid',location:'Spain',flag:'sp.png'),
    WorldTime(url:'Asia/Colombo',location:'Sri lanka',flag:'sl.png'),
    WorldTime(url:'Asia/Bangkok',location:'Thailand',flag:'t.png'),
    WorldTime(url:'Asia/Dubai',location:'U A E',flag:'uae.png'),


    ];

  void updateTime(index) async
  {
    WorldTime q = location[index];
    await q.getData();
    //navigate to homescreen

    Navigator.pop(context,{

      'location':q.location,
      'flag':q.flag,
      'time':q.time,
      'day':q.day,
      'datee':q.datee,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: location.length,
        itemBuilder: (context, index)
      {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
          child: Card(
            color: Colors.lightBlue[100],
            child: ListTile(
            onTap: (){
             updateTime(index);
            },
              title: Text(
                location[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/${location[index].flag}'
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
