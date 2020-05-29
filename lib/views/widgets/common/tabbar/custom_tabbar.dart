import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fanme_flutter/views/widgets/common/tabbar/custom_tabbar_item.dart';
import 'package:fanme_flutter/views/widgets/common/tabbar/custom_tabbar_theme.dart';

class CustomTabBar extends StatefulWidget {
  final Function onSelectTab;
  final List<CustomTabBarItem> items;
  final CustomTabBarTheme theme;
  final int selectedIndex;

  CustomTabBar({
    Key key,
    this.selectedIndex = 0,
    @required this.onSelectTab,
    @required this.items,
    @required this.theme,
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onSelectTab != null);
  }

  @override
  _CustomTabBarState createState() =>
      _CustomTabBarState(selectedIndex: selectedIndex);
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex;
  _CustomTabBarState({this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final CustomTabBarTheme theme = widget.theme;
    final bgColor =
        theme.barBackgroundColor ?? Theme.of(context).bottomAppBarColor;

    return MultiProvider(
      providers: [
        Provider<CustomTabBarTheme>.value(value: theme),
        Provider<int>.value(value: widget.selectedIndex),
      ],
      child: Container(
        margin: const EdgeInsets.only(bottom: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50.0),
            bottom: Radius.circular(50.0),
          ),
          color: bgColor,
          boxShadow: [
            const BoxShadow(
              color: Color(0x20003049),
              blurRadius: 0,
              spreadRadius: 1,
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: theme.barHeight,
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items.map((item) {
                var index = widget.items.indexOf(item);
                item.setIndex(index);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.onSelectTab(index);
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: SizedBox(
                      child: item,
                      height: theme.barHeight,
                      width: MediaQuery.of(context).size.width /
                          widget.items.length,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
