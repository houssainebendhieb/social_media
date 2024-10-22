import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/data/firebase_auth_repo.dart';
import 'package:social_media/features/auth/presentation/auth_screen.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:social_media/features/homescreen/presentation/home_page.dart';
import 'package:social_media/light_mode.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authRepo = FirebaseAuthRepo();
  runApp(BlocProvider(
    create: (context) => AuthCubit(authRepo)..checkUser(),
    child: MaterialApp(
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is Unauthenticated) {
              return AuthScreen();
            } else if (state is Authenticated) {
              return HomePage();
            }
            print(state);
            return Text("serveur down try again ");
          },
          listener: (index, state) {},
        )),
  ));
}
