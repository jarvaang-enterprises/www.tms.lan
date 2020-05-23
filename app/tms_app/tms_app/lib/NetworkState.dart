import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class NetworkStateSingleton {
  static final NetworkStateSingleton _state =
      new NetworkStateSingleton._internal();
  NetworkStateSingleton._internal();

  static NetworkStateSingleton getInstance() => _state;
  bool hasConnection = false;
  StreamController connectionChangeController =
      new StreamController.broadcast();
  final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => connectionChangeController.stream;

  void dispose() {
    connectionChangeController.close();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    bool previousConnection = hasConnection;

    try {
      final result = await http.get('http://www.google.com');
      // print(result);
      if (result.statusCode == 200) {
        hasConnection = true;
      } else {
        print('Connection failed!');
        hasConnection = false;
      }
    } on SocketException catch (_) {
      print('Connection failed!');
      hasConnection = false;
    } on PlatformException catch (_) {
      print('Connection failed!');
      hasConnection = false;
    } catch (_) {
      print('Connection failed!');
      hasConnection = false;
    }

    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }
    return hasConnection;
  }
}
