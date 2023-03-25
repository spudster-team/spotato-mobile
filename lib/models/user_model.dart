class UserModel {
  String firstName;
  String lastName;
  String phone;
  String email;
  String username;
  String? password;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'username': username,
      'password': password,
    };
  }
}
