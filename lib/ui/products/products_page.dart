import 'package:booze_flutter/bloc/cart_bloc/cart_bloc.dart';
import 'package:booze_flutter/bloc/categories/categories_bloc.dart';

import 'package:booze_flutter/ui/shared/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_strings/strings.dart';

import '../../models/cart/cart_items.dart';
import '../components/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    int cartCount(
        {required int? productId, required List<CartItems> cartItems}) {
      if (cartItems.isNotEmpty) {
        for (var element in cartItems) {
          if (element.product.id == productId) {
            return element.quantity;
          }
        }
      }
      return 0;
    }

    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          var categoriesState = state;
          if (categoriesState is CategoriesLoadedState) {
            return BlocListener<CartBloc, CartState>(
              listener: (context, state) {},
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            screenWidth(context) > screenHeight(context)
                                ? 5
                                : 2,
                        childAspectRatio: 181 / 234,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 20),
                    itemCount: categoriesState.products.length,
                    itemBuilder: (context, index) => ProductCard(
                      shadeColor: '#ffc0a0',
                      image:
                          '${Strings.baseUrl}${Strings.imageUrl}/${categoriesState.products[index].imagePath}',
                      price: double.parse(
                          categoriesState.products[index].price.toString()),
                      title: categoriesState.products[index].title,
                      unit: categoriesState.products[index].unit,
                      qtyInCart: (state is CartLoadedState)
                          ? cartCount(
                              cartItems: state.cartItems,
                              productId: categoriesState.products[index].id)
                          : 0,
                      onMinusTap: () => () {
                        if (kDebugMode) {
                          print('clinking');
                        }
                        BlocProvider.of<CartBloc>(context).add(
                          DecrementFromToCart(categoriesState.products[index]),
                        );
                      },
                      onPlusTap: () => () {
                        
                        BlocProvider.of<CartBloc>(context).add(
                          AddToCart(categoriesState.products[index]),
                        );
                      },
                      onFavoriteButtonTap: () => () {},
                      favoriteToggle: false,
                    ),
                    shrinkWrap: true,
                    primary: false,
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
