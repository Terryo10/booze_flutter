import 'package:flutter/material.dart';

class ProductsFilter extends StatefulWidget {
  const ProductsFilter({Key? key}) : super(key: key);

  @override
  State<ProductsFilter> createState() => _ProductsFilterState();
}

class _ProductsFilterState extends State<ProductsFilter> {  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [Text('Sort'), Text('Sort'), Text('Sort'), Text('Sort')],
    );
  }
}
