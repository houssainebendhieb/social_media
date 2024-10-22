import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/my_button.dart';
import 'package:social_media/features/auth/presentation/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController pwController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void login() {
    final String email = emailController.text;
    final String password = pwController.text;
    final authCubit = context.read<AuthCubit>();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("email or password not valid please try again")));
    } else {
      print(email);
      print(password);
      authCubit.login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Icon(Icons.lock_open_rounded,
                  size: 80, color: Theme.of(context).colorScheme.primary),
              const SizedBox(
                height: 50,
              ),
              Text("Welcome back,you've been missed",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16)),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: pwController,
                  hintText: "Password",
                  obscureText: true),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: login, text: "Login"),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("not a member?"),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
