import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fanme_flutter/views/widgets/common/buttons.dart';
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
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _isPasswordHidden = true;
  bool _isButtonDisabled = false;

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
      autovalidateMode: _autoValidate,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailCtrl,
            validator: (value) => Validator.email('email', value),
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
            validator: (value) => Validator.password('password', value),
            obscureText: _isPasswordHidden,
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
      hintText: toBeginningOfSentenceCase(hintText),
      fillColor: Colors.grey[100],
      isDense: true,
      prefixIcon: isTextArea ? null : Icon(prefixIcon),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordHidden = !_isPasswordHidden;
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
                    setState(() => _autoValidate = AutovalidateMode.always);
                  }
                },
        ),
      ),
    );
  }
}
