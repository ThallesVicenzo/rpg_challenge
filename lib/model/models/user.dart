class UserModel {
  String? email;
  String? password;
  String? token;

  UserModel({required this.email, required this.password, this.token});

  factory UserModel.fromJson(Map<String, String> json) => UserModel(
        email: json['email'],
        password: json['senha'],
        token: json['token'],
      );

  Map<String, String?> toJson() => {
        'email': email,
        'senha': password,
      };
}
