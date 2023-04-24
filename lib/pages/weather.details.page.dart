import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetails extends StatefulWidget {
  ///const MeteoDetail({Key? key}) : super(key: key);

  String city = "";

  WeatherDetails(this.city);

  @override
  State<WeatherDetails> createState() => _MethodDeatailsState();
}

class _MethodDeatailsState extends State<WeatherDetails> {
  var weatherdata;
  @override
  void initState() {
    super.initState();
    getWeatherData(widget.city);
  }

  void getWeatherData(String city) {
    print("city weather is " + city);
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=c109c07bc4df77a88c923e6407aef864";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.weatherdata = json.decode(resp.body);
        print(this.weatherdata);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather Page Details ${widget.city}',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body:
        weatherdata==null? Center(
          child:CircularProgressIndicator(),

        ):
        ListView.builder(
            itemCount: (weatherdata == null ? 0 : weatherdata['list'].length),
            itemBuilder: (context, index) {
              return Card(
                // color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.green, Colors.transparent])),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "images/${weatherdata['list'][index]['weather'][0]['main'].toLowerCase()}.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //text
                              Text(
                                "${new DateFormat('E—dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherdata['list'][index]['dt'] * 1000000))}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherdata['list'][index]['dt'] * 1000000))}"
                                "{$weatherdata['list'][index]['weather][0]['main']}",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "${(weatherdata['list'][index]['main']['temp'] - 273.15).round()} °C",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
