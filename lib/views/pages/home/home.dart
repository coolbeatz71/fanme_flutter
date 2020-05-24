import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003049),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.4, 1],
            colors: [
              Color(0x99FFFFFF),
              Color(0xFFEFEFEF),
              Color(0xFFEFEFEF),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFF77F00),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/img/logo_fanme.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: 'fanme',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003049)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'Hi,',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Welcome to our platform. \nConnect to start hanging with celebrities you always \nlove',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: LoginButton(
                      type: 'google',
                      text: 'Login with Google',
                      onTap: () {
                        print('click');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: LoginButton(
                      type: 'facebook',
                      text: 'Login with Facebook',
                      onTap: () {
                        print('click');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: LoginButton(
                      text: 'Login',
                      onTap: () {
                        print('click');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => null,
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: null,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    this.type,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  final String type;
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => null,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: type != null
                ? FaIcon(
                    _getIcon(),
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
      color: _getColor(),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
      ),
    );
  }

  IconData _getIcon() => type == 'facebook'
      ? FontAwesomeIcons.facebookF
      : FontAwesomeIcons.googlePlusG;

  Color _getColor() {
    switch (type) {
      case 'facebook':
        return Color(0xFF1959a9);
        break;
      case 'google':
        return Color(0xFF96281B);
        break;
      default:
        return Color(0xFF003049);
    }
  }
}
