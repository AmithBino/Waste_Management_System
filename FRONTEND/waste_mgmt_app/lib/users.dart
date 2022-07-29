import 'package:flutter/material.dart';
import 'package:waste_mgmt_app/map.dart';
import 'package:waste_mgmt_app/user/home.dart';
import 'package:waste_mgmt_app/user/payments.dart';
import 'package:waste_mgmt_app/user/shopping.dart';
import 'navbarcoll.dart';

class Users extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<Users> {
  int index = 0;
  final screens = [Home(), Payments(), Shopping()];
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
      body: screens[index],
      drawer: NavBar(),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Color(0xff1FAB89),
          indicatorColor: Color(0xff62D2A2),
          labelTextStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 255, 255, 255))),
        ),
        child: NavigationBar(
            height: 80,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: Icon(Icons.home, color: Color(0xffFFFFFF)),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.payment, color: Color(0xffFFFFFF)),
                  label: 'Payments'),
              NavigationDestination(
                  icon: Icon(Icons.shopping_cart, color: Color(0xffFFFFFF)),
                  label: 'Shopping'),
            ]),
      ),
    );
  }
}
