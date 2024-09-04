class User {
  final String? email;
  final String? password;
  final int? id;
  final String? token;

  User({ this.email,  this.password, this.id, this.token});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      token: json['token'],
    );
  }
}
