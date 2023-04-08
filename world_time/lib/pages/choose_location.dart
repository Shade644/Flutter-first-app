import 'package:flutter/material.dart';
import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _MyWidgetState();

}

class _MyWidgetState extends State<ChooseLocation> {

   List<WorldTime> locations = [
	    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
	    WorldTime(url: 'Europe/Warsaw', location: 'Warsaw', flag: 'pl.png'),
	    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'eg.png'),
	    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'ke.png'),
	    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'us.png'),
	    WorldTime(url: 'America/New_York', location: 'New York', flag: 'us.png'),
	    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'kr.png'),
	    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'id.png'),
   ];

   void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
  Navigator.pop(context, {
    'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
  });
   }
  
  @override
  Widget build(BuildContext context) {
    print('build function run');
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: () {
                print(locations[index].location);
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        }
      ),
      );
  }
}