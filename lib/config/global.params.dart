import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalParams {
  static Color customColor = Color(0xFF4CAF50);

  static List<Map<String, dynamic>> menus = [
    {"title": "Home", "icon": Icon(Icons.home, color: customColor), "route": "/home"},
    {"title": "Weather", "icon": Icon(Icons.sunny_snowing, color: customColor), "route": "/meteo"},
    {"title": "Gallerie", "icon": Icon(Icons.photo, color: customColor), "route": "/gallerie"},
    {"title": "Country", "icon": Icon(Icons.location_city, color: customColor), "route": "/country"},
    {"title": "Contact", "icon": Icon(Icons.contact_page, color: customColor), "route": "/contact"},
    {"title": "Parametre", "icon": Icon(Icons.settings, color: customColor), "route": "/parametres"},
    {"title": "Logout", "icon": Icon(Icons.logout, color: customColor), "route": "/auth"},
  ];

  static List<Map<String, dynamic>> accueil = [
    {"image": AssetImage('images/meteo.png'), "route": "/weather"},
    {"image": AssetImage('images/gallerie.jpg'), "route": "/gallerie"},
    {"image": AssetImage('images/pays.png'), "route": "/city"},
    {"image": AssetImage('images/contact.png'), "route": "/contact"},
    {"image": AssetImage('images/parametres.png'), "route": "/parametres"},
    {"image": AssetImage('images/logout.jpg'), "route": "/auth"},
  ];
}
