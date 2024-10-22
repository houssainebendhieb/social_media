// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:social_media/features/auth/domaine/entities/user.dart';
import 'package:social_media/features/auth/domaine/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AppUser? get currentUser => _currentUser;
  void checkUser() async {
    AppUser? user = await authRepo.getCurrentUser();

    if (user == null) {
      print("not");
      emit(Unauthenticated(failedMessage: ""));
    } else {
      emit(Authenticated(user));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    AppUser? appuser;
    var errMessage;
    authRepo.loginWithEmailPassword(email, password).fold((left) {
      appuser = left;
    }, (right) {
      errMessage = right;
    });
    if (appuser != null) {
      _currentUser = appuser;
      print("one");
      emit(Authenticated(appuser!));
    } else {
      emit(Unauthenticated(
          failedMessage: errMessage != null ? errMessage : " "));
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(AuthLoading());
    AppUser? user =
        await authRepo.registerWithEmailPassword(email, password, name);
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated(failedMessage: " "));
    }
  }

  Future<void> logout() async {
    authRepo.logout();
    emit(Unauthenticated(failedMessage: " "));
  }
}
