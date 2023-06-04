import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  String login;
  String password;

  User({
    required this.login,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    login: json["login"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "password": password,

  };
}