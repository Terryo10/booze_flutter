import 'package:booze_flutter/bloc/categories/categories_bloc.dart';

import 'package:booze_flutter/ui/shared/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_strings/strings.dart';

import '../components/product.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {},
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoadedState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      screenWidth(context) > screenHeight(context) ? 5 : 2,
                  childAspectRatio: 181 / 234,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 20),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              itemCount: state.products.length,
              itemBuilder: (context, index) => ProductCard(
                shadeColor: '#ffc0a0',
                image:
                    '${Strings.baseUrl}${Strings.imageUrl}/${state.products[index].imagePath}',
                price: double.parse(state.products[index].price.toString()),
                title: state.products[index].title,
                unit: state.products[index].unit,
                qtyInCart: 0,
                onMinusTap: () => () {},
                onPlusTap: () => () {
                  if (kDebugMode) {
                    print('fired');
                  }
                  
                  setState(() {
                    
                  });
                },
                onFavoriteButtonTap: () => () {},
                favoriteToggle: false,
              ),
              shrinkWrap: true,
              primary: false,
            );
          }
          return Container();
        },
      ),
    );
  }
}
