import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:waste_mgmt_app/chgepass.dart';
import 'package:waste_mgmt_app/collector.dart';
import 'package:waste_mgmt_app/form.dart';
import 'package:waste_mgmt_app/login_screen.dart';
import 'package:waste_mgmt_app/form.dart';

class NavBar extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
          color: Color(0xff62D2A2),
          child: ListView(padding: padding, children: <Widget>[
            const SizedBox(height: 100),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.account_circle,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Change Password',
              icon: Icons.key,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'FeedBack',
              icon: Icons.feedback_rounded,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout_rounded,
              onClicked: () => selectedItem(context, 3),
            ),
          ])),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(fontSize: 18, color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Collector(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChangePassword(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Feedbacks(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
        break;
    }
  }
}
