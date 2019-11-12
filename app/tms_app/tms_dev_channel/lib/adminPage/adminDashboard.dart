import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tms_app/NetworkState.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/adminPage/tenant_details.dart';

class Administration extends StatefulWidget {
  final NetworkStateSingleton ns;
  final js;

  const Administration({Key key, this.ns, this.js}) : super(key: key);

  @override
  AdministrationState createState() => AdministrationState(js: js);
}

class AdministrationState extends State<Administration> {
  final Future<User> js;
  static Map<String, dynamic> jsonTen;
  var jt;
  bool isLoading = false;

  AdministrationState({this.js});

  Future<Map<String, dynamic>> getTenantDetail() async {
    final response = await http
        .get('http://192.168.61.1/actions/app/get_tenants.php?app_secret');
    jt = TenantDetails.fromJson(jsonTen);
    return json.decode(response.body);
  }

  void initState() {
    super.initState();
    isLoading = true;
    var t = getTenantDetail();
    t.then((d) {
          jsonTen = d;
      if(jsonTen.isNotEmpty){
        setState(() {
          jsonTen = d;
          isLoading = false;
        });
      } else print(jsonTen.toString());
    });
    widget.ns.checkConnection();
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
              // if(snapshot.error == )
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
                _buildSuggestions(),
              );
            }
        }
      },
    );
  }

  // var _suggestions = ['0','1','2','3','4','5','6','7','8','9'];
  var _suggestions = jsonTen;
  dynamic _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
        } else {
          return _buildRow(jsonTen['ten_${index + 1}']);
        }
        // else return null;
      },
    );
  }

  Widget _buildRow(var pair) {
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
        icon: Icon(Icons.move_to_inbox),
        onPressed: () => print(pair),
      ),
    );
  }
}
