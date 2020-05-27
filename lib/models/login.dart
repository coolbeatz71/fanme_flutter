class Login {
  final String email;
  final String password;

  Login({this.email, this.password});

  Map<String, Object> get document => {'email': email, 'password': password};
}
