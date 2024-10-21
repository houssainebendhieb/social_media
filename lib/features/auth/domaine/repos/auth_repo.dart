import 'package:social_media/features/auth/domaine/entities/user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(
      String email, String password, String name);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}
