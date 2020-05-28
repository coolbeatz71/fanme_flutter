import 'package:fanme_flutter/core/helpers.dart';
import 'package:fanme_flutter/views/widgets/forms/login.dart';
import 'package:fanme_flutter/views/widgets/forms/register.dart';
import 'package:flutter/material.dart';

class LoginBottomSheetContainer extends StatelessWidget {
  const LoginBottomSheetContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF003049),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        child: Theme(
                          data: ThemeData(accentColor: Colors.white),
                          child: FloatingActionButton(
                            heroTag: key,
                            elevation: 1,
                            mini: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Color(0xFF003049),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: LoginForm(),
              ),
              GotoRegister()
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterBottomSheetContainer extends StatelessWidget {
  const RegisterBottomSheetContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0xFF003049),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        child: Theme(
                          data: ThemeData(accentColor: Colors.white),
                          child: FloatingActionButton(
                            heroTag: key,
                            elevation: 1,
                            mini: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Color(0xFF003049),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: RegisterForm(),
              ),
              GotoLogin()
            ],
          ),
        ),
      ),
    );
  }
}

class GotoRegister extends StatelessWidget {
  const GotoRegister({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
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
            onPressed: () {
              Navigator.of(context).pop();
              Helpers.showBottomSheetModal(
                context,
                RegisterBottomSheetContainer(),
              );
            },
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
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
    );
  }
}

class GotoLogin extends StatelessWidget {
  const GotoLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              "Already have an account?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              Helpers.showBottomSheetModal(
                context,
                LoginBottomSheetContainer(),
              );
            },
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Click to Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
