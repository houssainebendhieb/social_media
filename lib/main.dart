import 'package:flutter/material.dart';
import 'package:social_media/features/auth/presentation/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MaterialApp(
    home: AuthScreen(),
  ));
}




