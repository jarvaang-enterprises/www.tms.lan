import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatefulWidget {
  @override
  Page createState() => Page();
}
final FirebaseAuth _auth = FirebaseAuth.instance;
class Page extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email Firebase"),),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("SignInWithGoogle"),
              onPressed: () {
                
              },
            )
          ],
        ),
      ),
    );
  }

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  void signUpWithGoogle() async {
    FirebaseUser user;
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    user = (await _auth.signInWithCredential(credential)).user;
    if(user != null) {
      print("Signed into GoogleAccount " + user.displayName);
    }
  }

  void signOutUsingGoogle() async{
    await _auth.signOut().then((_){
      googleSignIn.signOut();
      print("Signed out successfully");
    });
  }

  // void signInWithEmail() async {
  //   FirebaseUser _user;
  //   try
  //   {
  //     _user = (await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;
  //   } catch (e) {
  //     print(e.toString());
  //   } finally {
  //     if(_user != null){
  //       print("User is signed in");
  //     } else print("User is not signed in");
  //   }
  // }
}