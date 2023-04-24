import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class ParametresPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Parametre")
        ),
        body:Center(
          child: Text(
            'Parametre Page ',
            style: Theme.of(context).textTheme.headline3,
          ),
        )
    );
  }

}