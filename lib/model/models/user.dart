class UserModel {
  String? email;
  String? password;

  UserModel({required this.email, required this.password});

  factory UserModel.fromJson(Map<String, String> json) => UserModel(
        email: json['email'],
        password: json['senha'],
      );

  Map<String, String> toJson() => {
        'email': email ?? '',
        'senha': password ?? '',
      };
}
