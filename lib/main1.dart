

import 'package:flutter/material.dart';

import 'widget/ListDeDepense.dart';
import 'bottomNav_bar.dart';
import 'model/depense.dart';
import 'screen/categorie-item_screen.dart';
import 'color.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _categorie = [
    'Transport',
    'Nourriture',
    'mode',
    'Santé',
    'Loyer',
    'Electricité',
  ];

  List<Depense> mesDepense = [];
  List<Depense> _userDepense = [
    Depense(titre: 'chaussure', montant: 20000.0, categorie: 'mode')
  ];


  void ajouterDepense(String title, double motant, String category){
    final addDep= Depense(
      titre: title,
      montant: motant,
      categorie: category,
      );
      setState(() {
        _userDepense.add(addDep);
        
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Depense Malin', style: TextStyle(color: Colors.black),)),
        backgroundColor: primaire,
      ),
    body: SingleChildScrollView(
      child: Column(
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
    
            ListDepense(mesDepense)
    
        ],
      ),
    ),
    

    bottomNavigationBar: Bottom_Nav_Bar(),
          
    );
  }
}

