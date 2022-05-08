import 'package:booze_flutter/models/categories/categories_model.dart';

class CartItems{
  final Product product;
   int quantity;

  CartItems({required this.product,required this.quantity});

   Map toJson() => {
        'product': product,
        'quantity': quantity,
      };


}