import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';
import 'connexionAvec.dart';
import 'monBouton_connexion.dart';
import 'mon_textField.dart';
import 'mot_de_passe_oublier.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, required this.onTap});
  final Function()? onTap;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //methode de connexion
  void singUser() async {
    //montrer une icon de chargement

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    //try sing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // pop l'icone de chargement
      Navigator.of(context).pop();
      monMessageDerreur(e.code);

      /* if (e.code == 'user-not-found') {
        //mauvais email
        messageMauvaisMail();
      } else if (e.code == 'wrong-password') {
        //mauvais mots de passe
        messageMauvaisMotDePasse();
      } */
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      /* const Icon(
            Icons.lock,
            size: 100,
          ), */
                      Image.asset(
                        "assets/images/ic_launcher.png",
                        height: MediaQuery.of(context).size.height / 8,
                      ),

                      const SizedBox(
                        height: 60,
                      ),

                      Text(
                        "Bienvenue!",
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

                      MonTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                    builder: (context) =>
                                        const MotDePasseOublier(),
                                  );
                                  Navigator.push(context, route);
                                },
                                child: const Text(
                                  "Mot de passe oublié?",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 49, 119, 223)),
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 42,
                      ),

                      MonButton(
                        onTap: singUser,
                        text: 'Connexion',
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
                                color: Colors.grey[700],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Ou continue avec',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[700],
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

                          const SizedBox(width: 40),

                          ConnexionAvec(
                            imagePath: 'assets/images/git.png',
                            onTap: () =>
                                AuthService().connexionAvecGithub(context),
                          ),
                          const SizedBox(width: 10),

                          // fb button
                          /*   ConnexionAvec(
                            imagePath: 'assets/images/fb.png',
                            onTap: () {},
                          ), */

                          //github button
                        ],
                      ),

                      const SizedBox(
                        height: 60,
                      ),

                      // not a member? register now
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pas encore inscrit?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                'S\'inscrire maintenant',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 49, 119, 223),
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