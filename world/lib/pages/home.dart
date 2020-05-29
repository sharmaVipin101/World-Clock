import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data: ModalRoute.of(context).settings.arguments;
    print(data);

    //set bg
    String greet = data['day'] ? "It's not time to sleep  ": 'Time to sleep';
    String bgimage = data['day'] ? 'morning.png': 'night.jpg';
    Color bg = data['day'] ? Colors.blue[900]:Colors.pink[700];
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgimage'),
            fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                Text(
                  '$greet',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40.0),
                FlatButton.icon(onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/Location');

                  setState(() {
                    data = {
                      'time':result['time'],
                      'location':result['location'],
                      'day':result['day'],
                      'flag':result['flag'],
                      'datee':result['datee']
                    };
                  });
                },

                    icon: Icon(Icons.edit_location,
                    color: Colors.white),
                    label: Text("Edit Location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        letterSpacing: 1.0,
                          color:Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color:Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  data['datee'],
                  style: TextStyle(
                    fontSize: 40.0,
                    color:Colors.white,
                  ),
                ),

              ],
            ),
          ),
        )
      ),
    );
  }
}
