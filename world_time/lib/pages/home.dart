import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _MyWidgetState();

}

class _MyWidgetState extends State<Home> {

    
  Map data = {};
    Object? parameters;

  @override
  Widget build(BuildContext context) {

     Map fill_data(){
    parameters = ModalRoute.of(context)!.settings.arguments;
    return jsonDecode(jsonEncode(parameters)) as Map;
  }

 data = data.isNotEmpty ? data: fill_data();
 
    print(data);

    //background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                  dynamic  result = await Navigator.pushNamed(context, '/Location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                ),
              ),
            ],
            ),
              ),
        ),
        ),
    );
  }
}