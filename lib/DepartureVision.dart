import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
class DepartureVision extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new CupertinoPageScaffold(
        navigationBar: new CupertinoNavigationBar(
          middle: new Text("Departures Tab"),
        ),
        child: new Text("hello world")
    );
  }
}
