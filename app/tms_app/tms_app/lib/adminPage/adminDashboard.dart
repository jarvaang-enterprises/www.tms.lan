import 'package:flutter/material.dart';
import 'package:tms_app/NetworkState.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/buttons.dart';

class Administration extends StatefulWidget {
  final NetworkStateSingleton ns;
  final js;

  const Administration({Key key, this.ns, this.js}) : super(key: key);

  @override
  AdministrationState createState() => AdministrationState(js: js);
}

class AdministrationState extends State<Administration> {
  final Future<User> js;

  AdministrationState({this.js});
  void initState() {
    widget.ns.checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Text(widget.ns.toString());
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
                body: _buildSuggestions(),
              );
            }
        }
      },
    );
  }

  var _suggestions = ['First Tenant', 'Second Tenant', 'Third Tenant', 'Fourth Tenant', 'Fifth Tenant','First Tenant', 'Second Tenant', 'Third Tenant', 'Fourth Tenant', 'Fifth Tenant'];
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        print(i);
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if(i>_suggestions.length) return null;
        return _buildRow(_suggestions[index]);
        // else return null;
      },
    );
  }

  Widget _buildRow(var pair) {
    return ListTile(
      title: Text(
        pair,
      ),
    );
  }
}
