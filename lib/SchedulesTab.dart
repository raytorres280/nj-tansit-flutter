import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_flutter/StationList.dart';


class SchedulesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SchedulesTabState();
  }
}

class SchedulesTabState extends State<SchedulesTab> {
  @override
    Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text("Schedules Tab"),
      ),
      child: new Center(
        child: new Text("hello"),
      ),
    );
  }
}
