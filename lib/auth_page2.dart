import 'package:depense_malin/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'creation_de_compte.dart';

class AutPage2 extends StatelessWidget {
  const AutPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //utilisater est connecter
          if (snapshot.hasData) {
            return const HomePage();
          }
          //utilisateur n'est pas connecter
          else {
            return const CreationDeComptePage();
          }
        },
      ),
    );
  }
}
