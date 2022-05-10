import 'package:booze_flutter/ui/body_builder.dart';
import 'package:flutter/material.dart';

import '../components/header.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return BodyBuilder(
        body: checkoutBody());
  }

  SingleChildScrollView checkoutBody() {
    return SingleChildScrollView(
          child: Column(children: const [
    Header(),
  ]));
  }
}
