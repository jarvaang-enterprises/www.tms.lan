import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushMessagingExample extends StatefulWidget {
  @override
  _PushMessagingExampleState createState() => _PushMessagingExampleState();
}

class _PushMessagingExampleState extends State<PushMessagingExample> {
  String _homeScreenText = "Waiting for token ...";
  int _bottomNavBarSelectedIndex = 0;
  int _numNotifications = 0;
  bool _newNotification = false;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        setState(() {
          _newNotification = true;
          _numNotifications++;
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _navigateToItemDetail(message);
      },
    );

    //iOS only
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
    .listen((IosNotificationSettings settings) {
      print("Setting registered: $settings");
    });

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _homeScreenText = "Push Messaging token: \n\n $token";
      });
      print(_homeScreenText);
    });
  }

  void _navigateToItemDetail(Map<String, dynamic> message) {
    final MessageBean item = _itemForMessage(message);
    Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
    if(!item.route.isCurrent) {
      Navigator.push(context, item.route);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Push Demo'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: _newNotification
                  ? Stack(
                children: <Widget>[
                  Icon(Icons.notifications),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 13,
                        minHeight: 13,
                      ),
                      child: Text(
                        _numNotifications.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              )
                  : Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
          ],
          currentIndex: _bottomNavBarSelectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
        body: Material(
          child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(_homeScreenText,style: TextStyle(fontSize: 19),),
            ),
          ),

        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavBarSelectedIndex = index;
      if(index == 1){
        _newNotification = false;
      }
    });
  }
}

final Map<String, MessageBean> _items = <String, MessageBean>{};
MessageBean _itemForMessage(Map<String, dynamic> message) {
  final dynamic data = message['data'] ?? message;
  final String itemId = data['id'];
  final MessageBean item = _items.putIfAbsent(
    itemId, () => MessageBean(itemId: itemId))
    ..status = data['status'];
    return item;
}

class MessageBean {
  MessageBean({this.itemId});
  final String itemId;

  StreamController<MessageBean> _controller = StreamController<MessageBean>.broadcast();
  Stream<MessageBean> get onChanged => _controller.stream;

  String _status;
  String get status => _status;
  set status(String value) {
    _status = value;
    _controller.add(this);
  }

  static final Map<String, Route<void>> routes = <String, Route<void>> {};
    Route<void> get route {
      final String routeName = '/details/$itemId';
      return routes.putIfAbsent(
        routeName,
        () => MaterialPageRoute<void>(
          settings: RouteSettings(name: routeName),
          builder: (BuildContext context) => DetailsPage(itemId),
        ),
      );
    }
  }

class DetailsPage extends StatefulWidget {
  DetailsPage(this.itemId);
  final String itemId;
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  MessageBean _item;
  StreamSubscription<MessageBean> _subscription;

  @override
  void initState() {
    super.initState();
    _item = _items[widget.itemId];
    _subscription = _item.onChanged.listen((MessageBean item) {
      if(!mounted) {
        _subscription.cancel();
      } else {
        setState(() {
          _item = item;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item ${_item.itemId}"),
      ),
      body: Material(
        child: Center(
          child: Text("Item status: ${_item.status}"),
        ),
      ),
    );
  }
}