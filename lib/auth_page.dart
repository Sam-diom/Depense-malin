import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    Navigator.of(context).pop();
  }

  void monMessageDerreur(String text) {
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
          const SizedBox(
            height: 8,
          ),

          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Mot de passe oublié?",
                    style: TextStyle(color: Colors.grey[600]),
                  )
                ],
              )),
          const SizedBox(
            height: 30,
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // google button
              ConnexionAvec(imagePath: 'assets/images/google.png'),

              SizedBox(width: 10),

              ConnexionAvec(imagePath: 'assets/images/GitHub-Mark.png'),
              SizedBox(width: 10),

              // fb button
              ConnexionAvec(imagePath: 'assets/images/fb.png'),

              //github button
            ],
          ),

          const SizedBox(
            height: 60,
          ),

          // not a member? register now
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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

class ConnexionAvec extends StatelessWidget {
  final String imagePath;

  const ConnexionAvec({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(imagePath),
      )),
    );
  }
}

class MonButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MonButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class MonTextField extends StatelessWidget {
  const MonTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  final String hintText;
  final bool obscureText;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
