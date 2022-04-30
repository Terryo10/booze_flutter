import 'package:booze_flutter/ui/cart/drawer_cart.dart';
import 'package:flutter/material.dart';

import 'components/side_menu.dart';

class BodyBuilder extends StatelessWidget {
  final Widget body;
  const BodyBuilder({ Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      drawer: const SideBarMenu() ,
      endDrawer: const DrawerCart(),
      body: body,
    );
  }
}