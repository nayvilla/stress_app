
// ignore: camel_case_types
class User_login {
  final String username;
  final String password;
  final bool isChecked;

  User_login({
    required this.username,
    required this.password,
    required this.isChecked,
  });

  User_login copyWith({
    String? username,
    String? password,
    bool? isChecked,
  }) {
    return User_login(
      username: username ?? this.username,
      password: password ?? this.password,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
