import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/config/global.params.dart';

class MyDrawer extends StatelessWidget{
  late SharedPreferences prefs;
  static Color customColor = Color(0xFF4CAF50);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.white,customColor])
          ),child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("images/profile.png"),
              radius: 100,
            ),
          ),
          ),
          ...(GlobalParams.menus as List).map((item){
          return ListTile(
          title :Text('${item['title']}',style:TextStyle(fontSize:22),),
          leading:item['icon'],
          trailing:Icon(Icons.arrow_right,color:Colors.blue,),
          onTap:()async{
            if('${item['title']}'!="Logout"){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "${item['route']}");
          }else{
              prefs =await SharedPreferences.getInstance();
              prefs.setBool("connected", false);
              Navigator.of(context).pushNamedAndRemoveUntil('/auth', (Route<dynamic>route) => false);
    }


    },
          );

          })
        ],
      ));
  }

}