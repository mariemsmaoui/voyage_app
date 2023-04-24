import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class  Auth extends StatelessWidget {
  // This widget is the root of your application.
  TextEditingController txt_login = new TextEditingController();
  TextEditingController txt_password = new TextEditingController();
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Authentifiction')),
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
                  onPressed: () {_onInscription(context);},
                  child: Text('connexion',style: TextStyle(fontSize: 22),)),
            ),

            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/inscription');
            }, child: Text("don't have an account? create here",style: TextStyle(fontSize: 19)),)
          ],
    ));

  }


  Future<void> _onInscription(BuildContext context)async{
    prefs= await SharedPreferences.getInstance();

      String login =prefs.getString("login") ??'';
      String pwd =prefs.getString("password") ??'';
      print(txt_password.text);
      if(txt_login.text==login && txt_password==pwd) {
        prefs.setBool("connected",true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      }
      else {
        const snackBar=SnackBar(content: Text('verify you email or password') , backgroundColor: Colors.red,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }


  }
}
