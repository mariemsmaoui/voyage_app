import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class GallerieDetails extends StatefulWidget {
  ///const MeteoDetail({Key? key}) : super(key: key);

  String keyword = "";

  GallerieDetails(this.keyword);

  @override
  State<GallerieDetails> createState() => _MethodDeatailsState();
}

class _MethodDeatailsState extends State<GallerieDetails> {
  var galleriedata;
  late int totalpages;
  late int current_apge=1;

  ScrollController scrollcontroller = new ScrollController();

  @override
  void initState() {
    super.initState();
    getGallerieData(widget.keyword);
  }

  void getGallerieData(String keyword) {
    print(" is " + keyword);
    String url =
        "https://pixabay.com/api/?key=35332344-2b465c40c7040feeac4ffc265&q=${keyword}";

    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.galleriedata = json.decode(resp.body);
        print(this.galleriedata);
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
            'Weather Page Details ${widget.keyword}',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: galleriedata == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
            itemCount: (galleriedata == null ? 0 : galleriedata['hits'].length),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                          child: Center(
                              child:Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                  ),
                                  child: Text(galleriedata['hits'][index]['tags'],
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),)))),
                      Card(
                          child: Container(
                              height: 300,
                              width: 500,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(galleriedata['hits']
                                      [index]['largeImageURL']),
                                      fit: BoxFit.fill))))
                    ],
                  ));
            }));
  }
}
class _GallerieDetailsPageState extends State<GallerieDetails> {
  var metaData;
  int per_page = 10;
  int currentPage = 1;
  ScrollController _controller = ScrollController();
  late int totalPages;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent){
        if(currentPage<totalPages){
          currentPage++;
          getGalleryData(widget.keyword);
        }
      }
    });
    getGalleryData(widget.keyword);
  }

  void getGalleryData(String keyword) {
    String api_key = "35332707-f7137582546ff3c38db1d7f4f";
    String url = "https://pixabay.com/api/?key=" + api_key + "&q=" + keyword + "&per_page=" + per_page.toString();
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.metaData = json.decode(resp.body);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Page Gallerie Details ${widget.keyword}'),
        ),
        body: metaData == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            controller: _controller,
            itemCount: (metaData == null ? 0 : metaData['hits'].length),
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        child: Center(
                            child:Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(metaData['hits'][index]['tags'],
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),))),
                        color: Colors.teal,),
                      Card(
                          child: Container(
                              height: 300,
                              width: 500,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(metaData['hits']
                                      [index]['largeImageURL']),
                                      fit: BoxFit.fill))))
                    ],
                  ));
            }));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}