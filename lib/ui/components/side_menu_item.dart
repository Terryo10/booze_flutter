import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key,required this.name,required this.icon, required this.onpressed}) : super(key: key);
   final String name;
   final IconData icon;
   final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: SizedBox( 
        height: 40,
        child: Row( 
          children: [ 
            Icon(icon, size: 20, color: Colors.white,),
            const SizedBox(width: 40,),
            Text(name, style: const TextStyle(fontSize: 20, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}