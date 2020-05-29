import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tms_app/states/states.dart';
import 'package:http/http.dart' as http;

void _logOut(BuildContext context) {
  var ns = Provider.of<States>(context, listen: false);
  if (ns.userData.source == 'SQL') {
    http.get('http://192.168.43.8/actions/app/logout.php?nin=' +
        ns.userData.userId);
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  } else if (ns.userData.source == 'Google') {
    _googleSignOut(context);
  } else if (ns.userData.source == 'Facebook') {
    // _facebookSignOut();
  }
}

void _googleSignOut(BuildContext context) {
  var ns = Provider.of<States>(context, listen: false);
  if (ns.hasConnection) {
    signOutUsingGoogle(context);
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }
}

void signOutUsingGoogle(BuildContext context) async {
  var ns = Provider.of<States>(context, listen: false);
  await ns.auth.signOut().then((_) {
    ns.googleSignIn.signOut();
    print("Signed out successfully");
  });
}

class NavDrawer extends StatelessWidget {
  final ctxt;

  const NavDrawer({Key key, this.ctxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ns = Provider.of<States>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              ns.userData.username,
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: AssetImage('assets/favicon.png')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => _logOut(context),
          ),
        ],
      ),
    );
  }
}
