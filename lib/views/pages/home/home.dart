import 'package:fanme_flutter/core/helpers.dart';
import 'package:flutter/material.dart';
import 'package:fanme_flutter/core/fade_animation.dart';
import 'package:fanme_flutter/views/widgets/common/buttons.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  showLoginModal(BuildContext context) {
    Helpers.showBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003049),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        height: MediaQuery.of(context).size.height,
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
        child: FadeAnimation(
          0.8,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FadeAnimation(
                    0.5,
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFF77F00),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(80.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/img/logo_fanme.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'fanme',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF003049),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    0.6,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Text(
                        'Hi,',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Welcome to our platform. \nConnect to start hanging with celebrities or fans you always love',
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
                            onPressed: () {
                              print('click');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: LoginButton(
                            type: 'facebook',
                            text: 'Login with Facebook',
                            onPressed: () {
                              print('click');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: LoginButton(
                            text: 'Login',
                            onPressed: () {
                              showLoginModal(context);
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
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 40),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
