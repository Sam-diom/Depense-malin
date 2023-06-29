import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'monBouton_connexion.dart';
import 'mon_textField.dart';

class MotDePasseOublier extends StatefulWidget {
  const MotDePasseOublier({super.key, this.onTap});
  final Function()? onTap;

  @override
  State<MotDePasseOublier> createState() => _MotDePasseOublierState();
}

class _MotDePasseOublierState extends State<MotDePasseOublier> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("mot de passe oublié"),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 185, 222, 224),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/ic_launcher.png",
                        height: MediaQuery.of(context).size.height / 8,
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      Text(
                        "Reinitialissons votre mot de passe!",
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
                        height: 40,
                      ),

                      MonButton(
                        onTap: singUserUp,
                        text: "Envoyer",
                      ),
                      const SizedBox(
                        height: 80,
                      ),

                      const Text(
                          "Un message de reinitialisation vous sera envoyé"),

                      const SizedBox(
                        height: 50,
                      ),

                      const SizedBox(
                        height: 60,
                      ),
                    ]),
              ),
            ))));
  }

  singUserUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try sing in
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      setState(() {
        emailController.text = " ";
      });

      monMessageDerreur("Verifiez votre boite mail");
    } on FirebaseAuthException catch (e) {
      // pop l'icone de chargement
      Navigator.of(context).pop();
      monMessageDerreur(e.code);
      setState(() {
        emailController.text = " ";
      });
      
    }
  }

  void monMessageDerreur(String text) {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Colors.red,
            title: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }));
  }
}
