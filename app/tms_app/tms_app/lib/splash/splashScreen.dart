import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms_app/widgets/TenDataProv.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // bool isLoggedIn
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    final TenDataProv app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    ns.user.then((value) => 
      value.username == 'Null'
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/adminPg'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/favicon.png'),
          fit: BoxFit.scaleDown,
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: new Text(
              'Loading resources ...',
              style: TextStyle(
                fontFamily: "Roboto",
                color: Colors.cyanAccent,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: new CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
                ),
              )),
        ],
      )),
    );
  }
}
