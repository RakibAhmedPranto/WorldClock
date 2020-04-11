import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos_Aires', flag: 'argentina.png'),
    WorldTime(url: 'America/Denver', location: 'Denver', flag: 'colorado.png'),
    WorldTime(url: 'America/Panama', location: 'Panama', flag: 'panama.png'),
    WorldTime(url: 'Asia/Baghdad', location: 'Baghdad', flag: 'baghdad.png'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'bangkok.jpg'),
    WorldTime(url: 'Asia/Dhaka', location: 'Dhaka', flag: 'dhaka.png'),
    WorldTime(url: 'Asia/Dili', location: 'Dili', flag: 'dili.png'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.jpg'),
    WorldTime(url: 'Asia/Gaza', location: 'Gaza', flag: 'gaza.jpg'),
    WorldTime(url: 'Asia/Karachi', location: 'Karachi', flag: 'karachi.png'),




  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose A Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
