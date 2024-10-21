class AppUser {
  final String uid;
  final String email;

  final String name;
  AppUser({required this.email, required this.uid, required this.name});

  Map<String, dynamic> toJson() {
    return {'name': name, 'uid': uid, 'email': email};
  }

  factory AppUser.fromJson(Map<String, dynamic> user) {
    return AppUser(
      email: user['email'],
      name: user['name'],
      uid: user['uid'],
    );
  }
}
