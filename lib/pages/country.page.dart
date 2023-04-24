import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class CountryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Country"),
          backgroundColor: Color(0xFF4CAF50),
        ),
        body:Center(
          child: Text(
            ' country Page',
            style: Theme.of(context).textTheme.headline3,
          ),
        )
    );
  }

}