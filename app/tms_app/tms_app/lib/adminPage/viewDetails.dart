import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewDetails extends StatefulWidget {
  final js;
  final dynamic ten;

  const ViewDetails({Key key, this.js, this.ten}) : super(key: key);

  @override
  ViewDetailsState createState() => ViewDetailsState(js: js, ten: ten);
}

class ViewDetailsState extends State<ViewDetails> {
  final js;
  final dynamic ten;
  var c = Colors.black, tenSpec, msg = "Loading required Data\nPlease wait ...";

  ViewDetailsState({this.js, this.ten});
  var isLoading = false;

  dynamic getTenantDetail(var nin) async {
    try {
      final response = await http.post(
          'http://192.168.43.8/actions/getSpecTen.inc.php',
          body: {'tNIN': nin});
      setState(() {
        tenSpec = json.decode(response.body);
        isLoading = false;
      });
      return response;
    } on SocketException catch (_) {
      setState(() {
        msg = "Check your Internet Connection";
        c = Colors.red;
      });
      // sleep(Duration(seconds: 2));
      // Navigator.pop(context);
    }
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
        Text(msg, style: TextStyle(color: c)),
      ],
    );
  }

  @override
  void initState() {
    isLoading = true;
    getTenantDetail(ten['id']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0, right: 7.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(js.data.photoUrl),
              radius: 20.0,
            ),
          )
        ],
      ),
      body: Scaffold(
          backgroundColor: Colors.white,
          body: isLoading
              ? bodyProgress()
              : Container(
                  width: double.infinity,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(ten['photoUrl']),
                            radius: 70.0,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          ten['user'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "NIN: " + ten['id'],
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                      new Container(
                        width: double.infinity,
                        margin: EdgeInsets.all(15.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Tenant Details",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.purpleAccent,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                      "Mobile Number: ",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      tenSpec['dets']['contact'],
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                      "Email Address: ",
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      tenSpec['dets']['email']
                                              .contains('Placeholder')
                                          ? tenSpec['dets']['email']
                                              .split(':')[1]
                                          : tenSpec['dets']['email'],
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
    );
  }
}
