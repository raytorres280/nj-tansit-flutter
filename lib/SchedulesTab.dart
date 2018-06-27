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
  FocusNode focus = new FocusNode();
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
        headers: {"Accept": "application/json"});
    this.setState(() {
      stations = json.decode(response.body);
    });
  }

  void _fetchAvailableTrains() async {
    print("do async fetch with start and end stops");
  }

  void onFocusChange() {
    print("detected text tap, show modal");
    print(this.focus.hasFocus.toString());
    if (this.focus.hasFocus) {
      //end text field has focus show endstation modal
      showModalBottomSheet(
          context: this.context,
          builder: (BuildContext context) {
            return new Container(
                child: new Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: new ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, int index) {
                        return new Text('hello world');
                      },
                    )
          });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focus.addListener(this.onFocusChange);
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
                          border: InputBorder.none, hintText: "Start Station"),
                    ),
                    onTap: () {
                      print("tap detected");
                    },
                  ),
                ),
                new Card(
                  child: new TextField(
                    focusNode: focus,
                    decoration: new InputDecoration(
                        border: InputBorder.none, hintText: "End Station"),
                  ),
                ),
                new FlatButton(
                  onPressed: () {
                    print("hello world");
                  },
                  child: new Text("search"),
                  color: Colors.blue,
                )
              ],
            ),
          ),
          new ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, int index) {
            return new Text('hello world');
            },
          )
        ],
      ),
    );
  }
}
