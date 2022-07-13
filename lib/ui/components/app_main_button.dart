import 'package:booze_flutter/ui/shared/styles.dart';
import 'package:flutter/material.dart';

class AppMainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isLoading;

  const AppMainButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17),
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.black,
              Color.fromARGB(196, 0, 0, 0),
            ],
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 10),
              blurRadius: 9,
            ),
          ],
        ),
        child: isLoading == true
            ? const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: FittedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : FittedBox(
              child: Text(
                  text,
                  style: heading7,
                ),
            ),
      ),
    );
  }
}
