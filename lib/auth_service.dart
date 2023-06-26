import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
/* import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger; 
 */
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //package google_sign_in
  //Map<String, dynamic>? _userData;

  connexionAvecGoogle() async {
    //debut du processus
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain auth detail from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //créer un nouvelle identifiant pour l'utilisateur
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    //connectons nous mtn
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  connexionAvecGithub(BuildContext context) async {
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: "c4aff79f0e49bc8d5f68",
        clientSecret: "dae7fbe44ede3a1abbcbbd96ccd9fc7b68f5682f",
        redirectUrl:
            "https://authentificationdepensemalin.firebaseapp.com/__/auth/handler");
    final result = await gitHubSignIn.signIn(context);
    final token = result.token;
    final credential = GithubAuthProvider.credential(token!);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  motDePasseOublier(){
    
  }

  /*  Future<UserCredential> connexionAvecFacebook() async {
    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: ['email']);

    if (loginResult == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(loginResult.message);
    }
    final OAuthCredential oAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  } */
}
