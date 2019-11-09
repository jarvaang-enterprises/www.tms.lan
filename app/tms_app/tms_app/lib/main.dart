import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:tms_app/NetworkState.dart';
import 'package:tms_app/adminPage/adminPage.dart';
import 'package:tms_app/dashboard/dashboard.dart';
import 'package:tms_app/splash/splashScreen.dart';

import 'Icons/StackedIcons.dart';
import 'User/user.dart';
import 'login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  NetworkStateSingleton networkState = NetworkStateSingleton.getInstance();
  networkState.initialize();
  runApp(MyApp(ns: networkState));
}

class MyApp extends StatelessWidget {
  final NetworkStateSingleton ns;
  const MyApp({Key key, this.ns}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tenant Management System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SplashScreen(ns: ns),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  final NetworkStateSingleton ns;

  const MyHomePage({Key key, this.ns}) : super(key: key);
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  // final FacebookLogin facebookLogin = new FacebookLogin();
  var gtext = 'Sign in with Google';
  var tr;
  var det;
  var gtextStyle;
  bool isLoading = false;
  void signUpWithFacebook() async {
    FirebaseUser user;
    Map<String, dynamic> udata;
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
        Text("Logging in ..."),
      ],
    );
  }
  void signUpWithGoogle() async {
    FirebaseUser user;
    Map<String, dynamic> udata;
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    user = (await _auth.signInWithCredential(credential)).user;
    if (user != null) {
      print("Signed into GoogleAccount " + user.photoUrl);
      String username = user.displayName;
      String photoUrl = user.photoUrl;
      String id = user.uid;
      udata = {
        'status': 0,
        'rights': '0',
        'id': id,
        'user': username.toString(),
        'photoUrl': photoUrl.toString(),
        'source': 'Google'
      };
      setState(() {
        det = udata;
      });
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => det['status'] == 0
                ? AdminDashboard(
                    js: _googleLogin(udata),
                    ns: widget.ns,
                  )
                : Dashboard(
                    js: _googleLogin(udata),
                    ns: widget.ns,
                  )));
  }

  void initState() {
    widget.ns.checkConnection();
    tr = _handleStart();
    _handleStart().then((d) {
      gtext =
          det == false ? 'Sign in with Google' : 'Continue as ' + det['user'];
      gtextStyle = det == false
          ? TextStyle(fontSize: 20, color: Colors.grey)
          : TextStyle(fontSize: 15, color: Colors.grey);
    });
    super.initState();
  }
  Future<User> _googleLogin(var user) async {
    return User.fromJson(user);
  }
  Future<User> _handleStart() async {
    FirebaseUser _user;
    Map<String, dynamic> udata;
    _user = await _auth.currentUser();
    if (_user == null) {
      String user = 'Null';
      String photoUrl = 'Null';
      String id = 'Null';
      udata = {
        'status': 4,
        'rights': '4',
        'id': id,
        'user': user.toString(),
        'photoUrl': photoUrl.toString(),
        'source': 'Google'
      };
      setState(() {
        det = false;
      });
    } else {
      String user = _user.displayName;
      String photoUrl = _user.photoUrl;
      String id = _user.uid;
      udata = {
        'status': 0,
        'rights': '0',
        'id': id,
        'user': user.toString(),
        'photoUrl': photoUrl.toString(),
        'source': 'Google'
      };
      setState(() {
        det = udata;
      });
    }
    // return udata;
    return User.fromJson(udata);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widgetGoogleSignIn() {
      return OutlineButton(
        clipBehavior: Clip.hardEdge,
        splashColor: Colors.grey,
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          print(det);
          det != false
              ? tr.then((data) {
                  data == false
                      ? signUpWithGoogle()
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => det['status'] == 0
                                  ? AdminDashboard(
                                      js: tr,
                                      ns: widget.ns,
                                      auth: _auth,
                                      googleSignIn: googleSignIn
                                    )
                                  : Dashboard(
                                      js: tr,
                                      ns: widget.ns,
                                      auth: _auth,
                                      googleSignIn: googleSignIn
                                    )));
                })
              : signUpWithGoogle();
          // else print('No Internet Connection');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    gtext,
                    maxLines: 2,
                    style: gtextStyle,
                    overflow: TextOverflow.fade,
                  ))
            ],
          ),
        ),
      );
    }

    Widget _widgetEmailSignIn() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(ns: widget.ns)));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.email),
              // Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Email',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget _widgetFacebookSignIn() {
      return OutlineButton(
        splashColor: Colors.grey,
        onPressed: () => print("Facebook Sign In not implemented"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 10, 5.0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.face),
              // Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Facebook',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return isLoading
          ? bodyProgress()
          : new Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TmsStackedIcons(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: new Text(
                      "Tenant",
                      style: new TextStyle(
                          fontSize: 30.0, color: Colors.orangeAccent),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: new Text(
                    " Management",
                    style:
                        new TextStyle(fontSize: 30.0, color: Colors.redAccent),
                  ),
                )
              ],
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: new Text(
                        "System",
                        style: new TextStyle(
                            fontSize: 30.0, color: Colors.blueAccent),
                      ))
                ]),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _widgetEmailSignIn(),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _widgetGoogleSignIn(),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _widgetFacebookSignIn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
