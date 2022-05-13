import 'package:booze_flutter/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class FloatingActionCart extends StatelessWidget {
  const FloatingActionCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: () {
          Scaffold.of(context).openEndDrawer();
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 8, right: 2),
          alignment: Alignment.center,
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                color: appGreenColor.withOpacity(0.26),
              ),
            ],
          ),
          child: const Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
