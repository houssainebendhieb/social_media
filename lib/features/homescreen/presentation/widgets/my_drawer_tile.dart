import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  const MyDrawerTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap});
  final Icon icon;
  final String title;
  final Function() ontap;

  Widget build(context) {
    return ListTile(
      onTap: ontap,
      title: Text(title),
      leading: icon,
    );
  }
}
