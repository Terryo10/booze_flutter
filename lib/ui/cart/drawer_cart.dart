import 'package:booze_flutter/bloc/cart_bloc/cart_bloc.dart';
import 'package:booze_flutter/models/cart/cart_items.dart';
import 'package:booze_flutter/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../constants/app_strings/constants.dart';
import '../../constants/app_strings/strings.dart';
import '../shared/helpers.dart';

class DrawerCart extends StatefulWidget {
  const DrawerCart({Key? key}) : super(key: key);

  @override
  State<DrawerCart> createState() => _DrawerCartState();
}

class _DrawerCartState extends State<DrawerCart> {
  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat("#,##0.00", "en_US");
    return Drawer(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            List<CartItems> cartItems = state.cartItems;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  header(),
                  ...slidable(cartItems, context, currencyFormat)
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Row header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 1,
          child: FittedBox(
            child: Text(
              'Shopping Cart',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green ,fontSize: 20),
            ),
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }

  List<Widget> slidable(List<CartItems> cartItems, BuildContext context,
      NumberFormat currencyFormat) {
    return List.generate(
      cartItems.length,
      (index) => Slidable(
        endActionPane: ActionPane(
            extentRatio: 0.22,
            motion: const ScrollMotion(),
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CartBloc>(context).add(RemoveFromToCart(cartItems[index].product));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 11),
                  width: (screenWidth(context) * 0.22) - 17,
                  alignment: Alignment.center,
                  color: appRedColor,
                  child: Image.asset(
                    AssetConstants.deleteIcon,
                    height: 28,
                  ),
                ),
              )
            ]),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(right: 7),
          margin: const EdgeInsets.only(
            left: 17,
            right: 17,
            top: 11,
          ),
          color: Colors.white,
          child: Row(
            children: [
              Container(
                width: 104,
                padding: const EdgeInsets.only(top: 15, bottom: 8),
                color: Colors.transparent,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 18),
                      child: FittedBox(
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Color(
                              int.parse(
                                '0xFFffc0a0',
                              ),
                            ).withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 8, top: 15),
                      child: FittedBox(
                          child: Image.network(
                              '${Strings.baseUrl}${Strings.imageUrl}/${cartItems[index].product.imagePath}')),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    '\$' +
                        currencyFormat
                            .format(cartItems[index].product.price ?? 0)
                            .toString() +
                        '  x  ' +
                        (cartItems[index].quantity).toString(),
                    style: paragraph6.copyWith(color: appGreenColor),
                  ),
                  Text(
                    cartItems[index].product.title ?? '',
                    style: heading7.copyWith(color: Colors.black),
                  ),
                  Text(
                    cartItems[index].product.unit ?? '',
                    style: paragraph6,
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 41,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          BlocProvider.of<CartBloc>(context)
                              .add(AddToCart(cartItems[index].product));
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 31,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AssetConstants.addIcon,
                            width: 13.5,
                          ),
                        ),
                      ),
                      Text(
                        cartItems[index].quantity.toString(),
                        style: paragraph4,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<CartBloc>(context).add(
                              DecrementFromToCart(cartItems[index].product));
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 31,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AssetConstants.subtractIcon,
                            width: 13.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
