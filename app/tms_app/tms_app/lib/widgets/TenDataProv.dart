import 'package:flutter/material.dart';
import 'package:tms_app/User/user.dart';
import 'package:tms_app/states/states.dart';
import 'package:tms_app/widgets/datastore.dart';

class TenDataProv with ChangeNotifier {
  TenDataProv(this._states);
  final States _states;

  States get states => _states;
  // User get user => _states?.user;
  void refresh() {
    notifyListeners();
  }

  void logout() async {
    await _states.logout();
  }
}