import 'package:flutter/material.dart';

import '../model/depense.dart';

class ListDepense extends StatelessWidget {

   ListDepense(this.mesDepense);
     final List<Depense> mesDepense;

  @override
  Widget build(BuildContext context) {
    return  Container(
             width: 400,
             height: 300,
             child: ListView.builder(
              itemCount: mesDepense.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 4,
                  child: ListTile(
                 leading: Text('${mesDepense[index].montant}Fr'),
                 title: Text(mesDepense[index].titre),
                 subtitle: Text(mesDepense[index].categorie),
                 trailing: Icon(Icons.delete, color: Colors.red,),
               ),
              );

              },
             ),
           );
  }
}