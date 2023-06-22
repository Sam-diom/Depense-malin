import 'package:flutter/material.dart';

class AddDepense extends StatefulWidget {
  const AddDepense({super.key});

  @override
  State<AddDepense> createState() => _AddDepenseState();
}

class _AddDepenseState extends State<AddDepense> {
  @override
  Widget build(BuildContext context) {
    return  Container(
             width: 400,
             height: 300,
             child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index){
                return Card(
                  elevation: 4,
                  child: ListTile(
                 onTap: (){},
                 title: Text('Achat de chaussure'),
                 subtitle: Text('24000fr'),
                 trailing: Icon(Icons.delete, color: Colors.red,),
               ),
              );

              },
             ),
           );
  }
}