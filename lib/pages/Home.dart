import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voyage/config/global.params.dart';

import '../menu/drawer.widget.dart';
class Home extends StatelessWidget {
  // This widget is the root of your application.
  //TextEditingController txt_login = new TextEditingController();
 // TextEditingController txt_password = new TextEditingController();
  late SharedPreferences prefs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home Page '),
        // set the background color of the app bar
      ),
      body: Center(
        child: Wrap(
          children: [
            ...(GlobalParams.accueil as List).map((item) {
              return InkWell(
                child: Ink.image(
                  height: 180,
                  width: 180,
                  image: item['image'],
                ),
                onTap: () {
                  if ('${item["route"]}' != "/auth")
                    Navigator.pushNamed(context, "${item['route']}");
                  else
                    _logout(context);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connected", false);
    Navigator.of(context).pushNamedAndRemoveUntil('/auth', (Route route) => false);
  }




}