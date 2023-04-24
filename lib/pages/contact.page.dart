import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';

class ContactPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text("Contact"),

        ),
        body:Center(
          child: Text(
            'Contact Page ',
            style: Theme.of(context).textTheme.headline3,
          ),
        )
    );
  }

}