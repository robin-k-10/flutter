class User {
  final String imagePath;
  final String name;
  final String email;
  final String phone;
  final String birth;

  const User(
      {required this.imagePath,
      required this.name,
      required this.email,
      required this.phone,
      required this.birth});

  User copy(
          {String? imagePath,
          String? name,
          String? email,
          String? phone,
          String? birth}) =>
      User(
        imagePath: imagePath ?? this.imagePath,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        birth: birth ?? this.birth,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        imagePath: json['imagePath'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        birth: json['birth'],
      );

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'phone': phone,
        'birth': birth,
      };
}
