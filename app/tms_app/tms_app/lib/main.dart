import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:tms_app/states/states.dart';
import 'package:tms_app/widgets/LocalStorage.dart';
import 'package:tms_app/widgets/TenDataProv.dart';
import 'Icons/StackedIcons.dart';
import 'User/user.dart';
import 'adminPage/adminDashboard.dart';
import 'login/login.dart';
import 'adminPage/adminPage.dart';
import 'dashboard/dashboard.dart';
import 'splash/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  static var provider = TenDataProv(null);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<States>(
        future: States.create(dataStore: LocalStorage()),
        builder: (context, snapshot) {
          final repository = snapshot.data;
          provider = TenDataProv(repository);
          return MultiProvider(
            providers: [ChangeNotifierProvider.value(value: provider)],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Scaffold(
                body: SplashScreen(),
              ),
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return _makeRoute(
                        context: context,
                        routeName: settings.name,
                        arguments: settings.arguments);
                  },
                  maintainState: true,
                  fullscreenDialog: false,
                );
              },
            ),
          );
        });
  }

  Widget _makeRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    final Widget child = _buildRoute(
        context: context, routeName: routeName, arguments: arguments);
    return child;
  }

  Widget _buildRoute(
      {@required BuildContext context,
      @required String routeName,
      Object arguments}) {
    switch (routeName) {
      case '/home':
        return MultiProvider(
          providers: [ChangeNotifierProvider.value(value: provider)],
          child: MyHomePage(),
        );
      case '/login':
        return MultiProvider(
          providers: [ChangeNotifierProvider.value(value: provider)],
          child: LoginScreen(),
        );
      case '/adminPg':
        return MultiProvider(
          providers: [ChangeNotifierProvider.value(value: provider)],
          child: AdminDashboard(),
        );
      case '/adminDashb':
        return MultiProvider(
          providers: [ChangeNotifierProvider.value(value: provider)],
          child: Administration(),
        );
      case 'dashb':
      return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: provider)],
        child: Dashboard(),
      );
      default:
      return Container();
    }
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // final FacebookLogin facebookLogin = new FacebookLogin();
  var gtext = 'Sign in with Google';
  var tr;
  var det;
  var gtextStyle;
  bool isLoading = false;
  String msg = '';
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
        Text("Google Login in Progress ..."),
      ],
    );
  }

  void signUpWithGoogle() async {
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    FirebaseUser user;
    Map<String, dynamic> udata;
    final GoogleSignInAccount googleSignInAccount =
        await ns.googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    user = (await ns.auth.signInWithCredential(credential)).user;
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
    ns.user = _googleLogin(udata);
    Navigator.pushNamed(context, det['status'] == 0 ? '/adminDashb' : 'dashb');
  }

  void initState() {
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
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    FirebaseUser _user;
    Map<String, dynamic> udata;
    _user = await ns.auth.currentUser();
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
    var app = Provider.of<TenDataProv>(context, listen: false);
    var ns = app.states;
    ns.checkConnection();
    Widget _widgetGoogleSignIn() {
      ns.user = tr;
      return OutlineButton(
        clipBehavior: Clip.hardEdge,
        splashColor: Colors.grey,
        onPressed: () {
          ns.checkConnection();
          setState(() {
            isLoading = true;
          });
          det != false
              ? tr.then((data) {
                  data == false
                      ? signUpWithGoogle()
                      : Navigator.pushNamed(
                          context, det['status'] == 0 ? '/adminPg' : '/dashb');
                })
              : ns.hasConnection
                  ? signUpWithGoogle()
                  : setState(() {
                      isLoading = false;
                      ns.checkConnection();
                      msg = 'No Internet Connection';
                    });
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
          Navigator.pushNamed(context, '/login');
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
        onPressed: () {
          print("Facebook Sign In not implemented");
          setState(() {
            msg = 'Facebook Login Not Yet Implemented';
          });
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
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                width: double.infinity,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    bodyProgress(),
                  ],
                )))
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
                          style: new TextStyle(
                              fontSize: 30.0, color: Colors.redAccent),
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
                  Text(msg, style: TextStyle(color: Colors.red)),
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
