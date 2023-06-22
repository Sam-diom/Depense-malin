import 'package:depense_malin/auth_page.dart';
import 'package:flutter/material.dart';

import 'page_d_enregistrement.dart';

class CreationDeComptePage extends StatefulWidget {
  const CreationDeComptePage({super.key});

  @override
  State<CreationDeComptePage> createState() => _CreationDeComptePageState();
}

class _CreationDeComptePageState extends State<CreationDeComptePage> {
  //inittially show login page
  bool showLoginPage = true;
  //basculer entre la page d'inscription et la page de connexion
  void basculelationPage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return AuthPage(onTap: basculelationPage);
    } else {
      return PageDenregistrement(
        onTap: basculelationPage,
      );
    }
  }
}
