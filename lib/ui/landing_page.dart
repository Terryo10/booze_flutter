import 'package:booze_flutter/ui/components/banner.dart';
import 'package:booze_flutter/ui/components/header.dart';
import 'package:flutter/material.dart';

import 'components/category_slider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: const [
          Header(),
          CategorySlider(), 
         BannerPage(),
        ]
      ),
      
    ));
  }

 
}
