import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:social_media/features/auth/presentation/widgets/my_button.dart';
import 'package:social_media/features/auth/presentation/widgets/my_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});
  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final TextEditingController pwController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void register() {
    final String email = emailController.text;
    final String password = pwController.text;
    final String name = nameController.text;
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      ScaffoldMessenger(
        child: SnackBar(content: Text("email or password is empty")),
      );
    } else {
      final authCubit = context.read<AuthCubit>();
      authCubit.register(email, password, name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                  controller: nameController,
                  hintText: "Name",
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: "email",
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: pwController,
                  hintText: "  Password",
                  obscureText: true),
              const SizedBox(
                height: 25,
              ),
              MyButton(onTap: register, text: "Register"),
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
