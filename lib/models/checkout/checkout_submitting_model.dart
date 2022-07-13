import 'package:booze_flutter/models/checkout/address.dart';
import 'package:booze_flutter/models/checkout/extras_cart.dart';

class CheckoutSubmittingModel {
  final List<ExtrasCart> extras;
  final Address address;

  CheckoutSubmittingModel(this.extras, this.address);
}
