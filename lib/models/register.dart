class Register {
  final String pseudo;
  final String email;
  final String password;

  Register({this.pseudo, this.email, this.password});

  Map<String, Object> get document => {
        'pseudo': pseudo,
        'email': email,
        'password': password,
      };
}
