import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

class StationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StationListState();
  }
}

class StationListState extends State<StationList> {
  List data;

//  Future<String> getData() async {
//    var response = await http.get(
//      Uri.encodeFull("http://localhost:3000/stations"),
//      headers: {
//        "Accept": "application/json"
//      }
//    );
//    this.setState(() {
//      data = json.decode(response.body);
//    });
//    return "success!";
//  }

  @override
  void initState() {
//    this.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text("hello"),
          );
        }
    );
  }
}