import 'package:flutter/material.dart';
import'package:worlds_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';
  void setupWorldTime() async{

    WorldTime instance=WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    //print(instance.time);
    Navigator.pushReplacementNamed(context, '/home',arguments: {
    'location':instance.location,
     'flag':instance.flag,
      'time':instance.time,'isDayTime':instance.isDayTime,
    },);
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
    //print('object');
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:Center(child:SpinKitPouringHourGlassRefined
        (color: Colors.blueGrey,
        size: 80.0,),
      ),
    );
  }
}
