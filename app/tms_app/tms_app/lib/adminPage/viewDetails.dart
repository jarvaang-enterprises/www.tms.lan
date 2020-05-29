import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tms_app/widgets/TenDataProv.dart';
import 'package:tms_app/widgets/sidebar.dart';

class ViewDetails extends StatefulWidget {
  final ten;

  const ViewDetails({Key key, this.ten}) : super(key: key);
  @override
  ViewDetailsState createState() => ViewDetailsState(ten: ten);
}

class ViewDetailsState extends State<ViewDetails> {
  final dynamic ten;
  var c = Colors.black, tenSpec, msg = "Loading required Data\nPlease wait ...";

  ViewDetailsState({this.ten});
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

  Widget contacts() {
    var r = {};
    var dets = tenSpec['dets'] as Map;
    dets.forEach((key, value) {
      if (key.contains('contact')) {
        r[key] = value;
      }
    });
    if (r.length > 1) {
      return Padding(
        padding: EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  "Mobile Number: ",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  tenSpec['dets']['contact_1'],
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Home Number: ",
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  tenSpec['dets']['contact_2'],
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Padding(
          padding: EdgeInsets.only(left: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "Mobile Number: ",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold),
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
              )
            ],
          ));
  }

  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(backgroundColor: Colors.transparent, actions: [
        Padding(
          padding:
              EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0, right: 7.0),
          child: OutlineButton(
            borderSide: BorderSide.none,
            onPressed: () => _scaffoldkey.currentState.openEndDrawer(),
            child: CircleAvatar(
              backgroundImage: NetworkImage(ns.userData.photoUrl),
              radius: 20.0,
            ),
          ),
        ),
      ]),
      endDrawer: NavDrawer(ctxt: context),
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
                            backgroundImage:
                                NetworkImage(ns.tenData['photoUrl']),
                            radius: 70.0,
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          ns.tenData['user'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "NIN: " + ns.tenData['id'],
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
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    "Tenant Details",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.purpleAccent,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            contacts(),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: new Row(
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
                              ),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "House Details",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  tenSpec['dets']['house'] != null
                                      ? Row(
                                          children: [
                                            Text(
                                              "House Number: ",
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              tenSpec['dets']['house']['hNo'],
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            )
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Text(
                                              'The tenant was once a tenant but left!',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            )
                                          ],
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
    );
  }
}
