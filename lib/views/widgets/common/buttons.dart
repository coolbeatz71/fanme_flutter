import 'package:flutter/material.dart';
import 'package:fanme_flutter/core/fade_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginButton extends StatelessWidget {
  final String type;
  final String text;
  final Function onPressed;

  const LoginButton({
    Key key,
    this.type,
    @required this.text,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.0,
      child: FlatButton(
        onPressed: () => onPressed(),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: type != null
                  ? FaIcon(
                      _icon,
                      color: Colors.white,
                      size: 20,
                    )
                  : null,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
        color: _backgroundColor,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  IconData get _icon => type == 'facebook'
      ? FontAwesomeIcons.facebookF
      : FontAwesomeIcons.googlePlusG;

  Color get _backgroundColor {
    switch (type) {
      case 'facebook':
        return Color(0xFF1959A9);
      case 'google':
        return Color(0xFF96281B);
      default:
        return Color(0xFF003049);
    }
  }
}
