import 'package:auto_route/auto_route.dart';
import 'package:booze_flutter/bloc/cart_bloc/cart_bloc.dart';
import 'package:booze_flutter/bloc/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../responsive/responsive.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController _searchProductController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isMobile(context))
          AppBar(
              backgroundColor: Colors.black,
              title: const Text('Booze'),
              actions: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.shopping_bag),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                ),
              ])
        else if (Responsive.isDesktop(context))
          ...header()
        else if (Responsive.isTablet(context))
          AppBar(
            backgroundColor: Colors.black,
            title: const Text('Booze'),
          )
      ],
    );
  }

  List<Widget> header() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (() => Scaffold.of(context).openDrawer()),
                child: const Icon(Icons.menu_outlined)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  context.navigateNamedTo('/');
                },
                child: const Text(
                  'BOOZE Liquor & Drinks',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0))),
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 45,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey[50]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const FittedBox(
                            child: Text(
                              'Delivery',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const FittedBox(
                            child: Text(
                              'Pick Up',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  hintText: 'Search Location',
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  labelStyle: const TextStyle(fontSize: 12),
                  contentPadding: const EdgeInsets.only(left: 30),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey.shade50),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoadedState) {
                      return TextField(
                        controller: _searchProductController,
                        onChanged: (value) {
                          if (_searchProductController.text.isEmpty) {
                            //reset to all products
                            BlocProvider.of<CategoriesBloc>(context).add(
                                FilterByCategory(
                                    categoryId: -1,
                                    categoriesModel: state.categoriesModel));
                          } else {
                            BlocProvider.of<CategoriesBloc>(context).add(
                                FilterProducts(
                                    categoriesModel: state.categoriesModel,
                                    query: _searchProductController.text));
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.clear), // clear text
                            onPressed: () {
                              _searchProductController.clear();
                                   BlocProvider.of<CategoriesBloc>(context).add(
                                FilterByCategory(
                                    categoryId: -1,
                                    categoriesModel: state.categoriesModel));
                            },
                          ),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search Products',
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          labelStyle: const TextStyle(fontSize: 12),
                          contentPadding: const EdgeInsets.only(left: 30),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // context.navigateNamedTo('/login-page');
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.shopping_cart),
                          BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              if (state is CartLoadedState) {
                                return Text(' ${state.cartCount} Cart');
                              }
                              return const Text(' 0 Cart');
                            },
                          ),
                        ],
                      ))),
            ),
          ],
        ),
      ),
      const Divider(
        height: 2,
      ),
    ];
  }
}
