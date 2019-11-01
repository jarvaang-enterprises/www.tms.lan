import 'package:flutter/material.dart';
import 'package:tms_app/splash/splashScreen.dart';

import 'Icons/StackedIcons.dart';
import 'login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenant Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SplashScreen(),
      )
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _widgetGoogleSignIn() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () => print("Google Sign In not implemented"),            
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget _widgetEmailSignIn() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => LoginScreen())
          );
        },            
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.email),
              // Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Email',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget _widgetFacebookSignIn() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () => print("Facebook Sign In not implemented"),            
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.face),
              // Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Facebook',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TmsStackedIcons(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: new Text(
                      "Tenant",
                      style: new TextStyle(
                          fontSize: 30.0, color: Colors.orangeAccent),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new Text(
                    " Management",
                    style:
                        new TextStyle(fontSize: 30.0, color: Colors.redAccent),
                  ),
                )
              ],
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: new Text(
                        "System",
                        style: new TextStyle(
                            fontSize: 30.0, color: Colors.blueAccent),
                      ))
                ]),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _widgetEmailSignIn(),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _widgetGoogleSignIn(),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _widgetFacebookSignIn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}