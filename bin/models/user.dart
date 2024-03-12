class User {
  final int id;
  final String username;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["user"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": username,
        "password": password,
      };
}
