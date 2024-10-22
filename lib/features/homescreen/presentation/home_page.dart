import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:social_media/features/homescreen/presentation/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    final authRepo = context.read<AuthCubit>();
    authRepo.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
          ]),
      body: const Column(children: [
        Text("list of post soon hhh"),
      ]),
      drawer: MyDrawer(),
    );
  }
}
