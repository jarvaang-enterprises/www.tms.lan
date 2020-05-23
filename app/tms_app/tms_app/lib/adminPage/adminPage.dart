import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/login/login.dart';
import 'package:recase/recase.dart';
import 'package:tms_app/buttons.dart';
import 'package:tms_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:tms_app/states/states.dart';
import 'adminDashboard.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({Key key, this.det, this.auth, this.googleSignIn})
      : super(key: key);

  final FirebaseAuth auth;
  final det;
  final GoogleSignIn googleSignIn;

  @override
  DashBoardState createState() => new DashBoardState();
}

class DashBoardState extends State<AdminDashboard> {

  bool cMade = false;
  var jsonTen;
  var jt, isLoading = true;

  @override
  void initState() {
    setState(() {
      cMade = buttons.changesMade;
    });
    super.initState();
  }

  Column bodyProgress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
        Padding(
          padding: EdgeInsets.all(100),
          child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent, strokeWidth: 4.0),
        ),
        Text('Get tenant data ...'),
      ],
    );
  }

  void _googleSignOut() {
    signOutUsingGoogle();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
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

  dynamic getTenantDetail() {
    final response =
        http.get('http://192.168.43.8/actions/app/get_tenants.php?app_secret');
    setState(() {
      jsonTen = response;
    });
    jt = response;
    // response.then((value) => jt = value.body);
    return jt;
  }

  @override
  Widget build(BuildContext context) {
    var ns = Provider.of<States>(context);
    ns.checkConnection();
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
            child: FutureBuilder<User>(
          future: ns.user,
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
                              setState(() {
                                isLoading = true;
                              });
                              getTenantDetail();
                              setState(() {
                                isLoading = false;
                              });
                              jt.then((res) => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Administration(
                                                  jk: res.body,
                                                )))
                                  });
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
                                        'https://192.168.43.8/actions/app/logout.php?nin=' +
                                            snapshot.data.userId);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyHomePage()));
                                  } else if (snapshot.data.source == 'Google') {
                                    _googleSignOut();
                                  } else if (snapshot.data.source ==
                                      'Facebook') {
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
