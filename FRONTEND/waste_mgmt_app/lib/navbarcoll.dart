import 'dart:ui';

import 'package:flutter/material.dart';

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
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Change Password',
              icon: Icons.key,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'FeedBack',
              icon: Icons.feedback_rounded,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout_rounded,
            ),
          ])),
    );
  }

  buildMenuItem({required String text, required IconData icon}) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(fontSize: 18, color: color)),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }
}
