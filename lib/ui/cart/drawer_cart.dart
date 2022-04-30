import 'package:flutter/material.dart';

class DrawerCart extends StatefulWidget {
  const DrawerCart({Key? key}) : super(key: key);

  @override
  State<DrawerCart> createState() => _DrawerCartState();
}

class _DrawerCartState extends State<DrawerCart> {
  @override
  Widget build(BuildContext context) {
    return const Drawer();
  }
}