import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Inscription extends StatelessWidget {
  late SharedPreferences prefs;
  // This widget is the root of your application.
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Isncription')),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  controller: txt_login,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "username",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                  obscureText: true,

                  controller: txt_password,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child:
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight((50)),
                  ),
                  onPressed: () {
                    _onInscrire(context);
                  },
                  child: Text('inscription',style: TextStyle(fontSize: 22),)),
            ),


            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/auth');
            }, child: Text('login in here',style: TextStyle(fontSize: 19)),)
          ],
        ));
    // Center(child: Text('insrciption', style: TextStyle(fontSize: 22))));

  }
  Future<void> _onInscrire(BuildContext context)async{
    prefs= await SharedPreferences.getInstance();
    if(!txt_login.text.isEmpty && !txt_password.text.isEmpty)
      {
        prefs.setString("login", txt_login.text);
        prefs.setString("password", txt_password.text);
        prefs.setBool("connetcted", true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }else{
      const snackBar=SnackBar(content: Text('email or password  required!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }
}
