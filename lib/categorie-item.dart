// import 'package:flutter/material.dart';

// class CategorieItem extends StatelessWidget {
//   final String title;
//   final Color color;
//   const CategorieItem(this.title, this.color);

//   @override
//   Widget build(BuildContext context) {
//     return  InkWell(
//               splashColor: Theme.of(context).primaryColor,
//               borderRadius: BorderRadius.circular(15),
//               child: Container(
//                 child: Text(
//                   title,
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       color.withOpacity(0.7),
//                       color,
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight
//                     ),
//             borderRadius: BorderRadius.circular(15)
//         ),
//               ),
//             );
//   }
// }