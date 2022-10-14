// ignore_for_file: file_names

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  String? id;
  String? username;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "password": password,
      };
}
