import 'package:flutter/material.dart';

class AjoutModifContactPage extends StatelessWidget {
  const AjoutModifContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Ajouter/Modifier Contact'),
      ),
      body: Center(
        child: Text(
          'Page Ajouter/Modifier Contact',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}