import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    //bg img setting
    String bgcolor;
    Color bgcolors;
    bool bg= data['isDayTime'];
    if(bg=='false'){
      bgcolor="mor.jpg";
      bgcolors=Colors.indigo.shade400;
    }else{
      bgcolor="nig.jpg";
      bgcolors=Colors.white10;
    }
    return Scaffold(
      backgroundColor: bgcolors,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/$bgcolor'),fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
            children:<Widget>[
              TextButton.icon(onPressed: () async{
                dynamic result=await Navigator.pushNamed(context,'/location');
                setState(() {
                  data={
                    'time':result['time'],
                    'location':result['location'],
                    'isDayTime':result['isDayTime'],
                    'flag':result['flag']
                  };
                });
              },
                icon:const Icon(Icons.edit_location,color: Colors.grey,fill:1.0,size: 30.0,),
                label:const Text('Edit_Location',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:22.0 ),),
                ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
               Text(
                 data['location'],
                 style:const TextStyle(
                   fontSize: 35.0,fontWeight: FontWeight.bold,
                   letterSpacing: 7.56,
                 ),
               ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Text(data['time'],style:const TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic, ),)
            ],),
          ),
        ),
      ),
    );
  }
}
