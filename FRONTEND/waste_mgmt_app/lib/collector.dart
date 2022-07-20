import 'package:flutter/material.dart';

class Collector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Collector> {
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [Container()],
      ),
    ));
  }
}
