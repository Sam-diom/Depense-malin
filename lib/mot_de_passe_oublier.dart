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

  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
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
                      /* const SizedBox(
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
                      ), */

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
                        text: "soumettre",
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      // or continue with
                      /*    Padding(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                '***************',
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
                      ), */
                      const SizedBox(
                        height: 50,
                      ),

                      // google + apple sign in buttons
                      /*  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // google button
                          ConnexionAvec(
                            imagePath: 'assets/images/google.png',
                            onTap: () => AuthService().connexionAvecGoogle(),
                          ),

                          const SizedBox(width: 45),

                          ConnexionAvec(
                            imagePath: 'assets/images/git.png',
                            onTap: () {},
                          ),
                          const SizedBox(width: 10),

                          // fb button
                          /* ConnexionAvec(
                imagePath: 'assets/images/fb.png',
                onTap: () {},
              ), */

                          //github button
                        ],
                      ), */

                      const SizedBox(
                        height: 60,
                      ),

                      // not a member? register now
                      /* Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Vous avez déjà un compte?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                'connectez vous',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]), */
                    ]),
              ),
            ))));
  }

  singUserUp() {}
}
