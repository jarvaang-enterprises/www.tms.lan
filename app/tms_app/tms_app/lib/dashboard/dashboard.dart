import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/login/login.dart';
import 'package:recase/recase.dart';
import 'package:tms_app/main.dart';
import 'package:http/http.dart' as http;
import 'package:tms_app/states/states.dart';
import 'package:tms_app/widgets/TenDataProv.dart';

import '../choice.dart';

class Dashboard extends StatefulWidget {
  @override
  DashBoardState createState() => new DashBoardState();
}

class DashBoardState extends State<Dashboard> {
  Choice _value = choices[0];
  var source;
  var nin;
  void _select(Choice choice, {s}) {
    setState(() {
      _value = choice;
    });
    if (choice.title == 'Logout') {
      if (source == 'SQL') {
        http.get('http://192.168.43.8/actions/app/logout.php?nin=' + nin);
        Navigator.pushReplacementNamed(
            context, '/home');
      } else if (source == 'Google') {
        _googleSignOut();
      }
    }
  }

  void _googleSignOut() {
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    if (ns.hasConnection) {
      signOutUsingGoogle();
      Navigator.pushReplacementNamed(
          context, '/home');
    }
  }

  void signOutUsingGoogle() async {
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    await ns.auth.signOut().then((_) {
      ns.googleSignIn.signOut();
      print("Signed out successfully");
    });
  }

  // DashBoardState();

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    return FutureBuilder<User>(
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
              return new Text("Error: ${snapshot.error}");
            } else {
              if (snapshot.data.status != 0) {
                Navigator.pushReplacementNamed(context, '/login');
              }
              nin = snapshot.data.userId;
              source = snapshot.data.source;
              String fN =
                  ReCase(snapshot.data.username.split(' ')[0]).pascalCase;
              String lN =
                  ReCase(snapshot.data.username.split(' ')[1]).pascalCase;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.blueGrey,
                  actions: <Widget>[
                    _itemDown(snapshot),
                  ],
                ),
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data.photoUrl),
                          radius: 70.0,
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        snapshot.data.source == 'SQL'
                            ? fN + ' ' + lN
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
                  ],
                )),
              );
            }
        }
      },
    );
  }

  PopupMenuButton _itemDown(s) => PopupMenuButton<Choice>(
        onSelected: _select,
        color: Colors.grey,
        child: Padding(
          padding:
              EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0, right: 7.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(s.data.photoUrl),
            radius: 20.0,
          ),
        ),
        itemBuilder: (context) {
          return choices.map((Choice f) {
            return PopupMenuItem<Choice>(
                value: f,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      f.icon,
                      color: Colors.blueGrey,
                    ),
                    Text(f.title)
                  ],
                ));
          }).toList();
        },
      );
}
