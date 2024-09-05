class SignUpModel {
  final String username;
  final String phone;
  final String email;
  final String password;

  SignUpModel(
      {required this.username,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson (){
    return {
      'user_name' : username,
      'phone' : phone,
      'email' : email,
      'password' : password,
    };
  }
}


