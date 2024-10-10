class Account {
  final int id;
  final String email;
  final String phone;
  final String userName;

  Account(
      {required this.id,
      required this.email,
      required this.phone,
      required this.userName});

  factory Account.accountFromJson(Map<String, dynamic> json) {
    return Account(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        userName: json['user_name']);
  }
}

