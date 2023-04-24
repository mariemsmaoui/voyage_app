import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/gallerie_details_apge.dart';

class GalleriePage extends StatelessWidget{
  TextEditingController txt_keyword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Gallerie Page")),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: txt_keyword,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.image),
                  hintText: "keyword",
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
                _onGetGallerieDetails(context);
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
  void _onGetGallerieDetails(BuildContext context){
    String v = txt_keyword.text;
    Navigator.push(
        context,
        MaterialPageRoute(builder:
            (context) => GallerieDetails(v)));

    txt_keyword.text="";
  }
}