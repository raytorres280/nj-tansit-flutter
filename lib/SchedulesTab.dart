import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:transit_flutter/StationList.dart';
import 'package:transit_flutter/Station.dart';

class SchedulesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SchedulesTabState();
  }
}

class SchedulesTabState extends State<SchedulesTab> {
  List stations;
  List availableTrains;
  Station startStation;
  Station endStation;
  bool showStartModal;
  bool showEndModal;

  void _fetchStations() async {
    print("fetch all stations");
    var response = await http.get(
        Uri.encodeFull("http://localhost:3000/stations"),
        headers: {
          "Accept": "application/json"
        }
    );
    this.setState(() {
      stations = json.decode(response.body);
    });
  }

  void _fetchAvailableTrains() async {
    print("do async fetch with start and end stops");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        backgroundColor: Colors.blue,
        middle: new Text("Schedules Tab"),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(color: Colors.black),
            padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: new Column(
              children: <Widget>[
                new Card(
                  child: new GestureDetector(
                    child: new TextField(
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "Start Station"
                      ),
                      enabled: false,
                    ),
                    onTap: () {
                      print("tap detected");
                    },
                  ),
                ),
                new Card(
                  child: new TextField(
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        hintText: "End Station"
                    ),
                    enabled: false,
                  ),
                ),
                new FlatButton(
                  onPressed: () {
                    print("hello world");
                  }, child: new Text("search"),
                  color: Colors.blue,)
              ],
            ),
          ),
          new Expanded(
              child: new Container(
                  decoration: new BoxDecoration(color: Colors.blue),
                  child: new StationList()))
        ],
      ),
    );
  }
}
