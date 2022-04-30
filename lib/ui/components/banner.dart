import 'package:flutter/material.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerState();
}

class _BannerState extends State<BannerPage> {
  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 220,
        child: PageView(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          children: [card(), sec()],
          ),
      ),
    );
  }

  Card card() {
    return Card(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 3),
          ),
        ),
      ),
    );
  }

    Card sec() {
    return Card(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 3),
          ),
        ),
      ),
    );
  }
}
