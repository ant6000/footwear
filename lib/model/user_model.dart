class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String profilePic;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      uid: map["uid"] ?? "",
      phone: map["phone"] ?? "",
      profilePic: map["profilePic"] ?? "");
}
