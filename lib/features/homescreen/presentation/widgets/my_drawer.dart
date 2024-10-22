import 'package:flutter/material.dart';
import 'package:social_media/features/homescreen/presentation/widgets/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  Widget build(context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Icon(
              Icons.person,
              size: 25,
            ),
            MyDrawerTile(
                ontap: () {}, title: "HOME", icon: const Icon(Icons.home)),
            MyDrawerTile(
                ontap: () {},
                title: "SETTINGS",
                icon: const Icon(Icons.settings)),
            MyDrawerTile(
                ontap: () {}, title: "PROFILE", icon: const Icon(Icons.person)),
            MyDrawerTile(
                ontap: () {}, title: "LOGOUT", icon: const Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }
}
