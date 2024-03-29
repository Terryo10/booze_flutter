import 'package:auto_route/auto_route.dart';
import 'package:booze_flutter/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/app_main_button.dart';
import '../components/tittle_with_cost.dart';
import '../shared/styles.dart';

class ShippingWithCosts extends StatelessWidget {
  const ShippingWithCosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedState) {
          return Container(
            margin: const EdgeInsets.only(top: 13),
            constraints: const BoxConstraints(minHeight: 100),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 22),
                TitleWithCost(
                  title: 'Subtotal',
                  cost: state.total,
                  style: paragraph6,
                ),
                const SizedBox(height: 7),
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  height: 1,
                  color: appGreySecondary,
                ),
                TitleWithCost(
                  title: 'Total',
                  cost: state.total,
                  style: paragraph5,
                ),
                const SizedBox(height: 16),
                AppMainButton(
                    onTap: () {
                      context.navigateNamedTo('/Checkout');
                      Navigator.of(context).pop();
                    },
                    text: 'Checkout'),
                const SizedBox(height: 36),
              ],
            ),
          );
        } else {
          return AppMainButton(
              onTap: () {
                context.navigateNamedTo('/Checkout');
                Navigator.of(context).pop();
              },
              text: 'Checkout');
        }
      },
    );
  }
}
