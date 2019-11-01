import 'package:flutter/material.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/login/login.dart';
import 'package:recase/recase.dart';

class AdminDashboard extends StatefulWidget {
  final js;
  AdminDashboard({Key key, this.js}) : super(key: key);
  @override
  DashBoardState createState() => new DashBoardState(js);
}

class DashBoardState extends State<AdminDashboard> {
  final Future<User> js;
  DashBoardState(this.js);
  void _logOut() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.redAccent,
              ),
              tooltip: "Get me out of here",
              onPressed: _logOut,
            )
          ],
        ),
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
                  if (snapshot.data.status != 0){
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
                          fN + ' ' + lN + '(Admin)',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "NIN: " + snapshot.data.userId,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      )
                    ],
                  );
                }
            }
          },
        )));
  }
}
