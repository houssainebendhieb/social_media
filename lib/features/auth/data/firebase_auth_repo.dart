import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media/features/auth/domaine/entities/user.dart';
import 'package:social_media/features/auth/domaine/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {

  @override
  Future<AppUser?> getCurrentUser() async {
    User? user =await  FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    AppUser appUser = AppUser(email: user.email!, uid: user.uid, name: " ");
    return appUser;
  }

  @override
  Future<AppUser> loginWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: "");
      return user;
    } catch (e) {
      throw Exception("login Failed ");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      //
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
      String email, String password, String name) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      AppUser appuser = AppUser(email: email, name: name, uid: user.user!.uid);
      return appuser;
    } catch (e) {
      throw Exception("register failed");
    }
  }
}
