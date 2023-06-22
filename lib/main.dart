// main.dart
import 'package:depense_malin/bottomNav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Depense Malin',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // hintColor: Colors.amber,
        // canvasColor: Color.fromRGBO(255, 254, 229, 1),
        // textTheme: ThemeData.light().textTheme.copyWith(
        //   bodyText1: TextStyle(
        //     color: Color.fromRGBO(20, 51,51, 1)
        //   ),
        //   bodyText2: TextStyle(
        //     color: Color.fromRGBO(20, 51,51, 1)
        //   ),
        // )
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> expenses = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Depense Malin'),
      ),
     body: Bottom_Nav_Bar(),
    //  ListView.builder(
    //               itemCount: 5,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return
    //                 //  InkWell(
    //                 //   onTap: (){},
    //                 //   splashColor: Theme.of(context).primaryColor,
    //                 //   borderRadius: BorderRadius.circular(15),
    //                   // child:
    //                    Container(
    //                     child: Text('Montext', style: Theme.of(context).textTheme.titleLarge,),
    //                     decoration: BoxDecoration(
    //                      borderRadius: BorderRadius.circular(15),
    //                      color: Colors.black
    //                       )
    //                     );
    //                 // );
                    
    //               }
    //           ),
          
    );
  }
}

