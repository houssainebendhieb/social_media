import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media/features/auth/domaine/entities/user.dart';
import 'package:social_media/features/auth/domaine/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AppUser? get currentUser => _currentUser;

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    AppUser? user = await authRepo.loginWithEmailPassword(email, password);
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
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
      emit(Unauthenticated());
    }
  }

  Future<void> logout() async {
    authRepo.logout();
    emit(Unauthenticated());
  }
}
