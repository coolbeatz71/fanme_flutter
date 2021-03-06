import 'package:flutter/material.dart';
import 'package:ant_icons/ant_icons.dart';
import 'package:fanme_flutter/views/widgets/common/tabbar/custom_tabbar.dart';
import 'package:fanme_flutter/views/widgets/common/tabbar/custom_tabbar_item.dart';
import 'package:fanme_flutter/views/widgets/common/tabbar/custom_tabbar_theme.dart';
import 'package:fanme_flutter/views/widgets/common/drawer/custom_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: 'fanme',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(AntIcons.search_outline),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Demonstration'),
          ],
        ),
      ),
      bottomNavigationBar: buildCustomTabBar(),
    );
  }

  CustomTabBar buildCustomTabBar() {
    return CustomTabBar(
      theme: CustomTabBarTheme(
        selectedItemBorderColor: Colors.white,
        barBackgroundColor: Color(0x89EFEFEF),
        selectedItemBackgroundColor: Color(0xFFF77F00),
        selectedItemIconColor: Color(0xFF003049),
        unselectedItemIconColor: Color(0xFF7A8FA6),
        unselectedItemLabelColor: Color(0xFF7A8FA6),
        selectedItemLabelColor: Color(0xFF003049),
      ),
      selectedIndex: selectedIndex,
      onSelectTab: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        CustomTabBarItem(
          iconData: AntIcons.calendar_outline,
          label: 'Event',
        ),
        CustomTabBarItem(
          iconData: AntIcons.message_outline,
          label: 'Message',
        ),
        CustomTabBarItem(
          iconData: AntIcons.home_outline,
          label: 'Home',
        ),
        CustomTabBarItem(
          iconData: AntIcons.bell_outline,
          label: 'Notification',
        ),
        CustomTabBarItem(
          iconData: AntIcons.user,
          label: 'Profile',
        ),
      ],
    );
  }
}
