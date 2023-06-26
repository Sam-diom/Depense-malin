import 'package:flutter/material.dart';

class ConnexionAvec extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;

  const ConnexionAvec({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imagePath),
        )),
      ),
    );
  }
}
