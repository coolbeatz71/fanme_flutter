import 'package:ant_icons/ant_icons.dart';
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
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.transparent),
                      accountName: Text(
                        '@coolbeatz71',
                        style: listTileTextStyle,
                      ),
                      accountEmail: Text('sigmacool@gmail.com'),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          AntIcons.user,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                      otherAccountsPictures: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFF77F00),
                          child: IconButton(
                            icon: Icon(
                              AntIcons.edit_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.white24),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Fanbase',
                        style: listTileTextStyle,
                      ),
                      leading: buildlistTileIcon(AntIcons.team),
                      trailing: buildlistTileIcon(AntIcons.plus_circle_outline),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Direct message',
                        style: listTileTextStyle,
                      ),
                      leading: buildlistTileIcon(AntIcons.message_outline),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Settings',
                        style: listTileTextStyle,
                      ),
                      leading: buildlistTileIcon(AntIcons.setting_outline),
                    ),
                    ListTile(
                      dense: true,
                      title: Text(
                        'Help & support',
                        style: listTileTextStyle,
                      ),
                      leading:
                          buildlistTileIcon(AntIcons.question_circle_outline),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.white24,
                indent: 12.0,
                endIndent: 12.0,
                height: 0,
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  dense: true,
                  title: Text('Logout', style: listTileTextStyle),
                  leading: buildlistTileIcon(AntIcons.logout_outline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Icon buildlistTileIcon(IconData iconData) => Icon(
        iconData,
        size: 20,
        color: Colors.white,
      );

  TextStyle get listTileTextStyle {
    return TextStyle(
      fontSize: 16,
      color: Colors.white,
    );
  }
}
