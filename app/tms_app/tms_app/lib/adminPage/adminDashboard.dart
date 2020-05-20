import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms_app/NetworkState.dart';
import 'package:tms_app/User/user.dart';

import 'viewDetails.dart';

class Administration extends StatefulWidget {
  final js;
  final dynamic jk;

  const Administration({Key key, this.js, this.jk}) : super(key: key);

  @override
  AdministrationState createState() => AdministrationState(js: js);
}

class AdministrationState extends State<Administration> {
  final Future<User> js;
  bool isLoading = false;

  AdministrationState({this.js});

  void initState() {
    var ns = Provider.of<NetworkStateSingleton>(context);
    super.initState();
    ns.checkConnection();
  }

  Column bodyProgress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent, strokeWidth: 4.0),
        ),
        Text("Loading required Data\nPlease wait ..."),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var ns = Provider.of<NetworkStateSingleton>(context);
    return FutureBuilder<User>(
      future: widget.js,
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
                Text("Getting data..."),
              ],
            );
          default:
            if (snapshot.hasError) {
              return new Text("Error: ${snapshot.error}");
            } else {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 5.0, right: 7.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data.photoUrl),
                        radius: 20.0,
                      ),
                    )
                  ],
                ),
                body: isLoading ? 
                Scaffold(
                  backgroundColor: Colors.white,
                  body: Container(
                    width: double.infinity,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        bodyProgress(),
                        // Text(jsonTen.toString())
                      ], 
                    )
                  )
                ) : 
                _buildSuggestions(snapshot),
              );
            }
        }
      },
    );
  }

  // var _suggestions = ['0','1','2','3','4','5','6','7','8','9'];
  dynamic _buildSuggestions(var snap) {
    var _suggestions = json.decode(widget.jk);
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
        } else {
          return _buildRow(_suggestions['ten_${index + 1}'], snap);
        }
      },
    );
  }

  Widget _buildRow(var pair, var snap) {
    return ListTile(
      isThreeLine: true,
      subtitle: Text("NIN:${pair['id']}\nTenancy Status: active"),
      leading: Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0, right: 7.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(pair['photoUrl']),
          radius: 20.0,
        ),
      ),
      title: Text(
        pair['user'],
      ),
      trailing: IconButton(
        icon: Icon(Icons.info),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ViewDetails(js: snap, ten: pair))),
      ),
    );
  }
}
