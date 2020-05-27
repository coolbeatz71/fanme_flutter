import 'package:fanme_flutter/views/widgets/common/buttons.dart';
import 'package:flutter/material.dart';
import 'package:fanme_flutter/models/login.dart';
import 'package:fanme_flutter/core/validator.dart';

class LoginForm extends StatefulWidget {
  final Login login;

  const LoginForm({
    Key key,
    this.login,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _autoValidate = false;
  bool _isButtonDisabled = false;
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  /// Text controllers
  TextEditingController _emailCtrl;
  TextEditingController _passwordCtrl;

  @override
  void initState() {
    super.initState();

    _emailCtrl = TextEditingController(text: '');
    _passwordCtrl = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: _autoValidate,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailCtrl,
            validator: (value) => LoginValidator.email('email', value),
            decoration: buildInputDecoration(
              isTextArea: false,
              isPassword: false,
              hintText: 'email',
              prefixIcon: Icons.email,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _passwordCtrl,
            validator: (value) => LoginValidator.password('password', value),
            obscureText: _passwordVisible,
            decoration: buildInputDecoration(
              isTextArea: false,
              isPassword: true,
              hintText: 'password',
              prefixIcon: Icons.lock,
            ),
          ),
          SizedBox(height: 20.0),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgotten password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          buildSubmiButton(context, widget.login)
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration({
    bool isTextArea,
    bool isPassword,
    String hintText,
    IconData prefixIcon,
  }) {
    return InputDecoration(
      errorStyle: TextStyle(),
      filled: true,
      hintText: hintText,
      fillColor: Colors.grey[100],
      isDense: true,
      prefixIcon: isTextArea ? null : Icon(prefixIcon),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
          : null,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red[400]),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red[400]),
      ),
      contentPadding: EdgeInsets.all(20),
    );
  }

  Widget buildSubmiButton(BuildContext context, Login login) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: LoginButton(
          text: 'Login',
          onPressed: _isButtonDisabled
              ? null
              : () {
                  if (_formKey.currentState.validate()) {
                  } else {
                    setState(() => _autoValidate = true);
                  }
                },
        ),
      ),
    );
  }
}
