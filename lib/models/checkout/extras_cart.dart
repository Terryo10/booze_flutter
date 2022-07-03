import 'package:booze_flutter/models/checkout/checkout_model.dart';

class ExtrasCart {
  final Extra extra;
  int quantity;

  ExtrasCart({required this.extra, required this.quantity});

 Map toJson() => {
    'extra': extra,
    'quantity' : quantity,
 };
}
