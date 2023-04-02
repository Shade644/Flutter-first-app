import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Loading> {

  
  void getTime() async{

   Response response = await get(Uri(
        scheme: 'http',
        host: 'worldtimeapi.org',
        path: 'api/timezone/Europe/Warsaw'));
Map data = jsonDecode(response.body);
String datetime = data['datetime'];
String offset = data['utc_offset'].substring(0, 3);
DateTime now = DateTime.parse(datetime);
now = now.add(Duration(hours: int.parse(offset)));
print(now);
  }

  @override
  void initState(){
    super.initState();
    getTime();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}