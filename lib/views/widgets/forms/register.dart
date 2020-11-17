import 'package:flutter/material.dart';
import 'package:fanme_flutter/views/widgets/common/buttons.dart';
import 'package:fanme_flutter/models/register.dart';
import 'package:fanme_flutter/core/validator.dart';
import 'package:intl/intl.dart';

// TODO: I have to handle email duplication on firebase
class RegisterForm extends StatefulWidget {
  final Register register;

  const RegisterForm({
    Key key,
    this.register,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool _isPasswordHidden = true;
  bool _isButtonDisabled = false;

  final _formKey = GlobalKey<FormState>();

  /// Text controllers
  TextEditingController _pseudoCtrl;
  TextEditingController _emailCtrl;
  TextEditingController _passwordCtrl;
  TextEditingController _confPasswordCtrl;

  @override
  void initState() {
    super.initState();

    _pseudoCtrl = TextEditingController(text: '');
    _emailCtrl = TextEditingController(text: '');
    _passwordCtrl = TextEditingController(text: '');
    _confPasswordCtrl = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidate,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _pseudoCtrl,
            validator: (value) => RegisterValidator.pseudo('pseudo', value),
            decoration: buildInputDecoration(
              isTextArea: false,
              isPassword: false,
              hintText: 'pseudo',
              prefixIcon: Icons.person,
            ),
          ),
          SizedBox(height: 20),
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
          SizedBox(height: 20),
          TextFormField(
            controller: _confPasswordCtrl,
            validator: (value) => RegisterValidator.confPassword(
              ['password', 'confirm password'],
              [_passwordCtrl.text, value],
            ),
            obscureText: _isPasswordHidden,
            decoration: buildInputDecoration(
              isTextArea: false,
              isPassword: true,
              hintText: 'confirm password',
              prefixIcon: Icons.lock,
            ),
          ),
          SizedBox(height: 20.0),
          buildSubmiButton(context, widget.register)
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

  Widget buildSubmiButton(BuildContext context, Register register) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: LoginButton(
          text: 'Register',
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
