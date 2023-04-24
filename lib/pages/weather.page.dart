import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/weather.details.page.dart';

class Weather extends StatelessWidget {
  TextEditingController txt_city = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Weather Page")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_city,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  hintText: "city",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
              onPressed: () {
                _onGetMethodDetails(context);
              },
              child: Text(
                'Search',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _onGetMethodDetails(BuildContext context){
    String v = txt_city.text;
    Navigator.push(
        context,
        MaterialPageRoute(builder:
        (context) => WeatherDetails(v)));

    txt_city.text="";
  }
}
