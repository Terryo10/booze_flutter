import 'package:booze_flutter/models/checkout/checkout_model.dart';
import 'package:booze_flutter/repositories/checkout/checkout_provider.dart';

class CheckoutRepository{
  final CheckoutProvider provider;

  CheckoutRepository({required this.provider});

  Future<CheckoutDetailsModel> getCheckoutDetails() async {
    var data = await provider.getCheckoutDetails();
    return checkoutDetailsModelFromJson(data);
  }
}