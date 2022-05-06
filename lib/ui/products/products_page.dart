import 'package:booze_flutter/ui/shared/helpers.dart';
import 'package:flutter/material.dart';
import '../components/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth(context) > screenHeight(context) ? 5 : 2,
          childAspectRatio: 181 / 234,
          crossAxisSpacing: 18,
          mainAxisSpacing: 20),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      itemCount: 10,
      itemBuilder: (context, index) => ProductCard(
        shadeColor: '#ffc0a0',
        image: 'http://ishaqhassan.com:2000/assets/images/products/peach.png',
        price: 22,
        title: 'Peach',
        unit: 'dozen',
        qtyInCart: 0,
        onMinusTap: () => () {},
        onPlusTap: () => () {},
        onFavoriteButtonTap: () => () {},
        favoriteToggle: false,
      ),
      shrinkWrap: true,
      primary: false,
    );
  }
}
