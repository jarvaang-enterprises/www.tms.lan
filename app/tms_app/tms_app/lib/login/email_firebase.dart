import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailLogin extends StatefulWidget {
  @override
  Page createState() => Page();
}
final FirebaseAuth _auth = FirebaseAuth.instance;
class Page extends State<EmailLogin> {
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Email Firebase"),),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
            ),
            RaisedButton(
              child: Text("SignIn"),
              onPressed: () {
                signUpWithEmail();
              },
            )
          ],
        ),
      ),
    );
  }

  void signUpWithEmail() async {
    FirebaseUser _user;
    try
    {
      _user = (await _auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;
    } catch (e) {
      print(e.toString());
    }
  }

  void signInWithEmail() async {
    FirebaseUser _user;
    try
    {
      _user = (await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)).user;
    } catch (e) {
      print(e.toString());
    } finally {
      if(_user != null){
        print("User is signed in");
      } else print("User is not signed in");
    }
  }
}