// main.dart
import 'package:depense_malin/color.dart';
import 'package:flutter/material.dart';

import 'main1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Depense Malin',
      theme: ThemeData(
        primaryColor: primaire,
      ),
      home:  HomePage(),
    );
  }
}

