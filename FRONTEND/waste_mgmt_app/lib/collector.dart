import 'package:flutter/material.dart';
import 'package:waste_mgmt_app/map.dart';
import './user.dart';
import 'navbarcoll.dart';

class Collector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Collector> {
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: new Color(0xff1FAB89),
          elevation: 10.0,
          toolbarHeight: 90,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logoo.png',
                fit: BoxFit.contain,
                height: 60,
                width: 60,
              ),
              Container(padding: const EdgeInsets.all(25.0))
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(14))),
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.list,
              ),
            );
          }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                    child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/coll.png',
                        // height: 300,
                        width: 200,
                      ),
                    ),
                  ],
                )),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      (new Color(0xff1FAB89)),
                      new Color(0xff1FAB89)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Maps(),
                          ));
                    },
                    child: Text(
                      "OPEN MAP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 100),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      (new Color(0xff1FAB89)),
                      new Color(0xff1FAB89)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Pickups Completed : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ));
  }
}
