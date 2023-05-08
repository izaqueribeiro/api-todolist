class User {
  User(
      {this.name,
      this.email,
      this.password,
      this.id,
      this.username,
      this.token,
      this.picture});

  int? id;
  String? name;
  String? email;
  String? username;
  String? password;
  String? token;
  String? picture;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        token: json["token"],
        picture: json["picture"],
      );
}

User currentUser = User();

class Task {
  final int id;
  final int userId;
  final String name;
  final DateTime date;
  final int realized;

  Task({
    required this.id,
    required this.userId,
    required this.name,
    required this.date,
    required this.realized,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"] as int,
        userId: json["userId"] as int,
        name: json["name"] as String,
        date: DateTime.parse(json["date"]),
        realized: json["realized"] as int,
      );
}
