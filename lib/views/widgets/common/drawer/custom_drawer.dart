import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF003049),
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40.0)),
          ),
        ),
      ),
    );
  }
}
