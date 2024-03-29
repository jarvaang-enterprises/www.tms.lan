import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/login/login.dart';
import 'package:recase/recase.dart';
import 'package:tms_app/buttons.dart';
import 'package:tms_app/main.dart';
import 'package:http/http.dart' as http;

import '../NetworkState.dart';
import 'adminDashboard.dart';

class AdminDashboard extends StatefulWidget {
  final js;
  final NetworkStateSingleton ns;
  final det;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AdminDashboard(
      {Key key, this.js, this.det, this.ns, this.auth, this.googleSignIn})
      : super(key: key);
  @override
  DashBoardState createState() => new DashBoardState(js);
}

class DashBoardState extends State<AdminDashboard> {
  final Future<User> js;
  bool cMade = false;
  DashBoardState(this.js);

  @override
  void initState() {
    setState(() {
      cMade = buttons.changesMade;
    });
    widget.ns.checkConnection();
    super.initState();
  }

  void _googleSignOut() {
    signOutUsingGoogle();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(
                  ns: widget.ns,
                )));
  }

  void signOutUsingGoogle() async {
    await widget.auth.signOut().then((_) {
      widget.googleSignIn.signOut();
      print("Signed out successfully");
    });
  }

  bool getChanges() {
    return buttons.changesMade;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        body: Center(
            child: FutureBuilder<User>(
          future: js,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Text("No Connection");
              case ConnectionState.waiting:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlueAccent,
                          strokeWidth: 4.0),
                    ),
                    Text("Logging In ..."),
                  ],
                );
              default:
                if (snapshot.hasError) {
                  // if(snapshot.error == )
                  return new Text("Error: ${snapshot.error}");
                } else {
                  if (snapshot.data.status != 0) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                  String fN =
                      ReCase(snapshot.data.username.split(' ')[0]).pascalCase;
                  String lN =
                      ReCase(snapshot.data.username.split(' ')[1]).pascalCase;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data.photoUrl),
                            radius: 70.0,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          snapshot.data.source == 'SQL'
                              ? fN + ' ' + lN + '(Admin)'
                              : snapshot.data.username,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "NIN: " + snapshot.data.userId,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: OutlineButton(
                            onPressed: () {
                              print("Navigate to Administration Page");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Administration(
                                            ns: widget.ns,
                                            js: js,
                                          )));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            highlightElevation: 5,
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(2.5, 5, 2.5, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Go to Administration',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      getChanges()
                          ? Padding(
                              padding: EdgeInsets.all(8.0),
                              child: OutlineButton(
                                onPressed: () {
                                  setState(() {
                                    cMade = getChanges();
                                  });
                                  buttons.makeChanges(!cMade);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                highlightElevation: 5,
                                borderSide:
                                    BorderSide(color: Colors.lightBlueAccent),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2.5, 5, 2.5, 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Save Changes',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.lightGreenAccent,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                          : Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FlatButton(
                                onPressed: () {
                                  if (snapshot.data.source == 'SQL') {
                                    http.get(
                                        'http://192.168.61.1/actions/app/logout.php?nin=' +
                                            snapshot.data.userId);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                                  ns: widget.ns,
                                                )));
                                  } else if (snapshot.data.source == 'Google') {
                                    _googleSignOut();
                                  } else if(snapshot.data.source == 'Facebook'){
                                    // _facebookSignOut();
                                  }
                                },
                                color: Colors.redAccent,
                                splashColor: Colors.redAccent,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2.5, 5, 2.5, 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Log Out',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.lightGreenAccent,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                    ],
                  );
                }
            }
          },
        )));
  }
}
