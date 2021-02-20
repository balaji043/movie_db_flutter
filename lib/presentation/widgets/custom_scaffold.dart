import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key key, this.appBar, this.body}) : super(key: key);
  final PreferredSizeWidget appBar;
  final Widget body;
  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue,
        body: widget.body,
      );
}
