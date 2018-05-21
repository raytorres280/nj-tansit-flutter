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

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("http://localhost:3000/stations"),
      headers: {
        "Accept": "application/json"
      }
    );
    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["name"]);
    return "success!";
  }

  @override
  void initState() {
    this.getData();
    this.data = new List(0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Text(data[index]["name"]),
            ),
            
          );
        },
        padding: new EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}