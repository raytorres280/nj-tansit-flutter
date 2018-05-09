import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_flutter/SchedulesTab.dart';
//import 'package:transit_flutter/DepartureVision.dart';
//import 'package:transit_flutter/MyTix.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new MyAppState();
    }
}

class MyAppState extends State<MyApp> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new MaterialApp(
        home: new CupertinoTabScaffold(
            tabBar: new CupertinoTabBar(
                items: [
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.schedule),
                      title: new Text("Schedules")
                  ),
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.view_list),
                      title: new Text("DepartureVision")
                  ),
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.account_balance_wallet),
                      title: new Text("My Tix")
                  ),
                  new BottomNavigationBarItem(
                      icon: new Icon(Icons.account_box),
                      title: new Text("My Account")
                  ),
                ]
            ),
            tabBuilder: (BuildContext context, int index) {
              return new CupertinoTabView(
                builder: (BuildContext context) {
                  switch(index) {
                    case 0:
                      return new SchedulesTab();
                    case 1:
                      return new SchedulesTab();
                    case 2:
                      return new SchedulesTab();
                    case 3:
                      return new SchedulesTab();
                  }
                },
              );
            }
        )
      );
    }
}