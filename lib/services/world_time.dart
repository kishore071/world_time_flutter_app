import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{

  late String location; //location currently in
  late String time; //time in that particular location
  late String flag;//url to asset flag icon
  late String url;//location url
  late bool isDayTime;//finds day or not based on it returns the bg(assets or network based on preference) image
  WorldTime({required this.location,required this.flag,required this.url});
  Future<void> getTime() async {

    try{
      Response response=await get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
      Map data=jsonDecode(response.body);
      //print(data);
      String datetime=data['datetime'];
      //print(datetime);
      String offset=data['utc_offset'];
      String off=offset.substring(1,3);
      //print(off);
      DateTime now=DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(off)));
      //print(now);

      //time conversion happens here predefined dependencies
      time=DateFormat.jm().format(now);
      //print(time);
      //print(now.hour);
      //set the time property
      //late String boo;
      isDayTime = now.hour>= 12 ?true : false;
    }
    catch(e){
      print('System error! Wait for it to be corrected');
      time='Could not get Time Data';
    }
  }

}
