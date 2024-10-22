import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/features/auth/domaine/entities/user.dart';
import 'package:social_media/features/auth/domaine/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  @override
  Future<AppUser?> getCurrentUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user == null) {
      return null;
    }
    AppUser appUser = AppUser(email: user.email!, uid: user.uid, name: " ");
    return appUser;
  }

  @override
  Future<Either<AppUser, String>> loginWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser user =
          AppUser(uid: userCredential.user!.uid, email: email, name: "");
      return Left(user);
    } on FirebaseAuthException catch (e) {
      return Right(e.toString());
    } catch (e) {
      return Right(e.toString());
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
      await firebase
          .collection("users")
          .doc(user.user!.uid)
          .set(appuser.toJson());

      return appuser;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger(
        child: SnackBar(content: Text("${e.toString()}")),
      );
      return null;
    } catch (e) {
      throw Exception("register failed");
    }
  }
}
