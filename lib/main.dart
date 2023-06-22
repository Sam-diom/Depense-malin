// main.dart
import 'package:depense_malin/add_depense.dart';
import 'package:depense_malin/bottomNav_bar.dart';
import 'package:depense_malin/categorie-item.dart';
import 'package:depense_malin/color.dart';
import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _categorie = [
    'Transport',
    'Nourriture',
    'Vêtement',
    'Santé',
    'Loyer',
    'Electricité',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Depense Malin', style: TextStyle(color: Colors.black),)),
        backgroundColor: primaire,
      ),
    body: Column(
      children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
               child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index){
                  return CategorieItem(width:100, height: 40, text: '${_categorie[index]}',);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 3,);
                },
           ),
             ),
           ),
            Divider(color: noir,),
           Text("12juin"),
           Container(
            width: 400,
            height: 30,
            decoration: BoxDecoration(
             border: Border.all(
              color: noir
             ),
             borderRadius: BorderRadius.circular(20)
            ),
           ),
           Divider(color: noir,),

          AddDepense()

      ],
    ),
    

    bottomNavigationBar: Bottom_Nav_Bar(),
          
    );
  }
}

