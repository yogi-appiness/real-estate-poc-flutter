import 'package:firebase_auth/firebase_auth.dart' as fb;

class User {
  final String id;
  final String? name;
  final String email;

  User({
    required this.id,
    this.name,
    required this.email,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };

  factory User.fromFbUser(fb.User fbUser) =>
      User(id: fbUser.uid, name: fbUser.displayName, email: fbUser.email ?? "");
}
