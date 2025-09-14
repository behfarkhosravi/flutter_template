import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final String profileImageUrl;

  User({required this.name, required this.profileImageUrl});
}

final userProvider = Provider<User>((ref) {
  return User(
    name: 'John Doe',
    profileImageUrl: 'assets/images/user_profile.png',
  );
});
