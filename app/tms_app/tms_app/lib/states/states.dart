import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms_app/NetworkState.dart';
import 'package:tms_app/User/user.dart';

class States extends ChangeNotifier{
  static final app = new States._internal();
  NetworkStateSingleton networkState = NetworkStateSingleton.getInstance();
  States._internal();
  get loginData => _loadLoginData();
  Future<User> currentUser;
  dynamic googleUser;
  dynamic userdata;
  dynamic tData;
  set gUser(user) => googleUser = user;
  get gUser => googleUser;
  get hasConnection => networkState.hasConnection;
  set user(Future<User> user) => currentUser = user;
  set userData(data) => userdata = data;
  get userData => userdata;
  Future<User> get user => currentUser;
  set tenData(data) => tData = data;
  get tenData => tData;

  static States getInstance() => app;
  checkConnection() {
    networkState.checkConnection();
  }
  
  _loadLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  refresh(){
    app.notifyListeners();
  }
}