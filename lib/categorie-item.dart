import 'package:depense_malin/color.dart';
import 'package:flutter/material.dart';

class CategorieItem extends StatelessWidget {
  final double width;
  final double height;
  final String text;

 
 CategorieItem({super.key, required this.width, required this.height, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
                  onTap: (){},
                  child: Container(
                    // padding: EdgeInsets.all(8),
                    width: width,
                    height: height,
                          child: Center(
                            child: Text(
                                text,
                                style: Theme.of(context).textTheme.titleLarge,
                                ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                             gradient: LinearGradient(
                                colors: [
                                  primaire.withOpacity(0.7),
                                  Color.fromARGB(146, 76, 118, 186),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                                ),
                          ),
                          ),

                        
                      ),
    );
  
  
                      
          }

  }