import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:transit_flutter/StationList.dart';

class SchedulesList extends StatefulWidget {
  SchedulesListState createState() => new SchedulesListState();
}

class SchedulesListState extends State<SchedulesList> {

  List data;

  @override
    Widget build(BuildContext context) {
    return new StationList();
  }
}