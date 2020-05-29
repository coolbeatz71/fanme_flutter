import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fanme_flutter/views/widgets/common/tabbar/custom_tabbar_theme.dart';

// ignore: must_be_immutable
class CustomTabBarItem extends StatelessWidget {
  int index;
  int selectedIndex;
  CustomTabBarTheme theme;
  bool showSelectedItemShadow;
  double itemWidth;

  final String label;
  final IconData iconData;
  final Duration animationDuration;

  Color selectedBackgroundColor;
  Color selectedForegroundColor;
  Color selectedLabelColor;

  void setIndex(int index) {
    this.index = index;
  }

  Color _getDerivedBorderColor() =>
      theme.selectedItemBorderColor ?? theme.barBackgroundColor;

  Color _getBorderColor(bool isOn) =>
      isOn ? _getDerivedBorderColor() : Colors.transparent;

  bool get _isItemSelected => index == selectedIndex;

  static const kDefaultAnimationDuration = Duration(milliseconds: 1500);

  CustomTabBarItem({
    Key key,
    this.label,
    this.itemWidth = 60,
    this.selectedBackgroundColor,
    this.selectedForegroundColor,
    this.selectedLabelColor,
    this.iconData,
    this.animationDuration = kDefaultAnimationDuration,
  }) : super(key: key);

  Center _makeLabel(String label) {
    bool isSelected = _isItemSelected;
    return isSelected
        ? Center()
        : Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSelected
                    ? theme.selectedItemTextStyle.fontSize
                    : theme.unselectedItemTextStyle.fontSize,
                fontWeight: isSelected
                    ? theme.selectedItemTextStyle.fontWeight
                    : theme.unselectedItemTextStyle.fontWeight,
                color: isSelected
                    ? selectedLabelColor ?? theme.selectedItemLabelColor
                    : theme.unselectedItemLabelColor,
                height: 1.5,
              ),
            ),
          );
  }

  Widget _buildIconArea(double itemWidth, IconData iconData) {
    bool isSelected = _isItemSelected;
    double radius = itemWidth / 2;
    double innerBoxSize = itemWidth - 8;
    double innerRadius = (itemWidth - 8) / 2 - 4;

    return CircleAvatar(
      radius: isSelected ? radius : radius * 0.7,
      backgroundColor: _getBorderColor(isSelected),
      child: SizedBox(
        width: innerBoxSize,
        height: isSelected ? innerBoxSize : innerBoxSize / 2,
        child: CircleAvatar(
          radius: innerRadius,
          backgroundColor: isSelected
              ? selectedBackgroundColor ?? theme.selectedItemBackgroundColor
              : theme.unselectedItemBackgroundColor,
          child: _buildIcon(iconData),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData) {
    bool isSelected = _isItemSelected;
    return Icon(
      iconData,
      color: isSelected
          ? selectedForegroundColor ?? theme.selectedItemIconColor
          : theme.unselectedItemIconColor,
      size: 28,
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Provider.of<CustomTabBarTheme>(context);
    showSelectedItemShadow = theme.showSelectedItemShadow;
    itemWidth = theme.itemWidth;
    selectedIndex = Provider.of<int>(context);

    selectedBackgroundColor =
        selectedBackgroundColor ?? theme.selectedItemBackgroundColor;
    selectedForegroundColor =
        selectedForegroundColor ?? theme.selectedItemIconColor;
    selectedLabelColor = selectedLabelColor ?? theme.selectedItemLabelColor;

    bool isSelected = _isItemSelected;
    double itemHeight = itemWidth - 20;
    double topOffset = isSelected ? -12 : -16.5;
    double iconTopSpacer = 0;

    Widget labelWidget = _makeLabel(label);
    Widget iconAreaWidget = _buildIconArea(itemWidth, iconData);

    return AnimatedContainer(
      width: itemWidth,
      height: double.maxFinite,
      curve: Curves.bounceIn,
      duration: animationDuration,
      child: SizedBox(
        width: itemWidth,
        height: itemHeight,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: topOffset,
              left: -itemWidth / 2,
              right: -itemWidth / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: iconTopSpacer),
                  iconAreaWidget,
                  labelWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
