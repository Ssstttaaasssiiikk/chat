class UserModel {
  final String name;
  final String uid;
  final String email;
  final String login;

  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.login,
  });

  toJson() {
    return {
      'Name': name,
      'Uid': uid,
      'Email': email,
      'Login': login,
    };
  }
}
