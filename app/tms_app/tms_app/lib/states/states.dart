import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_app/NetworkState.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/config.dart' as Config;
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:device_info/device_info.dart';

import 'package:tms_app/widgets/datastore.dart';

class States {
  String _deviceId;
  String _tenData;
  User _user;
  NetworkStateSingleton networkState = NetworkStateSingleton.getInstance();
  DataStore get dataStore => _dataStore;
  get loginData => _loadLoginData();
  Future<User> currentUser;
  FirebaseAuth ath = FirebaseAuth.instance;
  GoogleSignIn googleSignin = new GoogleSignIn();
  dynamic googleUser, userdata, tData, jtData;
  bool loggedIn = false;
  get auth => ath;
  get googleSignIn => googleSignin;
  set gUser(user) => googleUser = user;
  get gUser => googleUser;
  get hasConnection => networkState.hasConnection;
  set user(Future<User> user) {
    currentUser = user;
    Future<dynamic> t = user;
    t.then((value) => value != null ? loginUser(value) : null);
    // getTenData();
  }

  set userData(data) => userdata = data;
  get userData => userdata;
  Future<User> get user => currentUser;
  set tenData(data) => tData = data;
  get tenData => tData;
  set jt(data) => jtData = data;
  get jt => jtData;

  final DataStore _dataStore;

  static Future<States> create({DataStore dataStore}) async {
    final ret = States(dataStore);
    dynamic data = ret.getUser();
    if (data != null) ret.user = data;

    return ret;
  }

  Future<User> getUser() async {
    _deviceId = await deviceId();
    final userId = await _dataStore.getString(_deviceId, Config.userId);
    final status = await _dataStore.getString(_deviceId, Config.status);
    final username = await _dataStore.getString(_deviceId, Config.username);
    final rights = await _dataStore.getString(_deviceId, Config.rights);
    final source = await _dataStore.getString(_deviceId, Config.source);
    final photoUrl = await _dataStore.getString(_deviceId, Config.photoUrl);
    final photo = await _dataStore.getImage(_deviceId, Config.photo);

    if (username == null) {
      return null;
    }

    final user = User(
        username: username,
        userId: userId,
        status: int.parse(status),
        rights: rights,
        source: source,
        photoUrl: photoUrl,
        photo: photo);

    return user;
  }

  // User get user => _user;

  States(this._dataStore, [User user]) {}
  checkConnection() {
    networkState.checkConnection();
  }

  void loginUser(User user) async {
    _deviceId = await deviceId();
    _dataStore.saveObject(_deviceId, 'userData', user as Map<dynamic, dynamic>);
    _dataStore.saveString(_deviceId, 'loggedIn', 'true');

    _user = user;
  }

  _loadLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future<String> deviceId() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    var deviceId = '';
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceId = await androidDeviceInfo.androidId;
    } else {
      final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceId = await iosDeviceInfo.identifierForVendor;
    }

    return deviceId;
  }

  void logout() async {
    _deviceId = await deviceId();
    // TODO Implement logout()
    await _dataStore.removeString(_deviceId, Config.photoUrl);
    await _dataStore.removeString(_deviceId, Config.userId);
    await _dataStore.removeString(_deviceId, Config.username);
    await _dataStore.removeString(_deviceId, Config.status);
    await _dataStore.removeString(_deviceId, Config.source);
    await _dataStore.removeString(_deviceId, Config.rights);

    _user = null;
    _tenData = '';
  }
}
