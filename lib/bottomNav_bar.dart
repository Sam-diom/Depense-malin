import 'package:depense_malin/add_depense.dart';
import 'package:depense_malin/color.dart';
import 'package:flutter/material.dart';

class Bottom_Nav_Bar extends StatelessWidget {

  
  const Bottom_Nav_Bar({super.key});

  void _shownavbar(BuildContext ctx){
     showBottomSheet(
      context: ctx, 
      builder: (_){
         return GestureDetector(
          onTap: (){},
          child: Container(
            height: 500,
            // child: AddDepense(),
          ),
         );
     }
      );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return  Container(
                width: size.width,
                height: 80,
                child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(size.width, 80),
                          painter: BNBCustomePainter(),
                        ),
                        Center(
                          heightFactor: 0.6,
                          child: FloatingActionButton(
                            onPressed:() => _shownavbar(context),
                            backgroundColor: noir,
                            child: Icon(Icons.add, color: blanc,),
                            elevation: 0.1,
                          ),
                        ),
                        Container(
                          width: size.width,
                          height: 80,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.home)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.category)),
                              Container(width: size.width*.20,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.bookmark)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.account_circle)),
                            ],
                          ),
                        )
                      ],
                    ),
                );
     
  }
}

class BNBCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = primaire
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);

     path.arcToPoint(Offset(size.width * .60, 20),
    radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width , 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, noir, 5, true);
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}