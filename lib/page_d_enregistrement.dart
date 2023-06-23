import 'package:depense_malin/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'connexionAvec.dart';
import 'monBouton_connexion.dart';
import 'mon_textField.dart';

class PageDenregistrement extends StatefulWidget {
  const PageDenregistrement({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<PageDenregistrement> createState() => _PageDenregistrementState();
}

class _PageDenregistrementState extends State<PageDenregistrement> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  //methode de  d'enregistrement
  void singUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try creation d'utilisateur
    try {
      //verifions si les mots de passe entrer sont les même
      if (passwordController.text == confirmPassword.text &&
          passwordController.text.length >= 6) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } else {
        //montrer un message d'erreur mot de passe pas identique
        Navigator.of(context).pop();
        monMessageDerreur('mot de passe non identique!');
      }

      // pop l'icone de chargement
    } on FirebaseAuthException catch (e) {
      // pop l'icone de chargement
      Navigator.of(context).pop();
      monMessageDerreur(e.code);
    }
  }

  //popup erreur d'email
  monMessageDerreur(String text) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          const Icon(
            Icons.lock,
            size: 100,
          ),
          const SizedBox(
            height: 40,
          ),

          Text(
            "Créons un compte pour vous!",
            style: TextStyle(color: Colors.grey[700], fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),

          //userName textField

          MonTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(
            height: 20,
          ),
          //password textfield
          MonTextField(
            controller: passwordController,
            hintText: 'Mot de passe',
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          //confirm password textfield
          MonTextField(
            controller: confirmPassword,
            hintText: 'Confirmer le mot de passe',
            obscureText: true,
          ),

          /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Mot de passe oublié?",
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              )), */
          const SizedBox(
            height: 40,
          ),

          MonButton(
            onTap: singUserUp,
            text: "S'inscrire",
          ),
          const SizedBox(
            height: 40,
          ),

          // or continue with
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Ou continue avec',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          // google + apple sign in buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // google button
              ConnexionAvec(
                imagePath: 'assets/images/google.png',
                onTap: () => AuthService().connexionAvecGoogle(),
              ),

              const SizedBox(width: 10),

              ConnexionAvec(
                imagePath: 'assets/images/GitHub-Mark.png',
                onTap: () {},
              ),
              const SizedBox(width: 10),

              // fb button
              ConnexionAvec(
                imagePath: 'assets/images/fb.png',
                onTap: () {},
              ),

              //github button
            ],
          ),

          const SizedBox(
            height: 60,
          ),

          // not a member? register now
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Vous avez déjà un compte?',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: widget.onTap,
              child: const Text(
                'connecter vous',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ]),
      ),
    ))));
  }
}
