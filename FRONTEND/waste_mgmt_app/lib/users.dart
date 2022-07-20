import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Users> {
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
