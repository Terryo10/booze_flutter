import 'package:booze_flutter/bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/checkout_bloc/checkout_bloc.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({Key? key}) : super(key: key);

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoadedState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              paymentMethod(state),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, cartstate) {
                  if (cartstate is CartLoadedState) {
                    return summaryWidget(
                        cartLoadedState: cartstate, checkoutLoadedState: state);
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Shipping Info card '),
              const SizedBox(
                height: 10,
              ),
              const Text('Delivery date state'),
            ],
          );
        } else {
          return const Center(
            child: Text(' NOTHING TO DISPLAY'),
          );
        }
      },
    );
  }

  Widget paymentMethod(CheckoutLoadedState state) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: SizedBox(
            child: Column(
              children: [Text('Payment Method : ${state.paymentMethod.name}')],
            ),
          ),
        ),
      ),
    );
  }

  Widget summaryWidget({
    required CheckoutLoadedState checkoutLoadedState,
    required CartLoadedState cartLoadedState,
  }) {
    return Column(
      children: [
        const Text('SUMMARY:'),
        const SizedBox(
          height: 10,
        ),
        productList(cartLoadedState),
        const SizedBox(
          height: 10,
        ),
        const Text('EXTRAS:'),
        const SizedBox(
          height: 10,
        ),
        extraCartList(checkoutLoadedState),
        const SizedBox(
          height: 10,
        ),
        const Text('Total Charge:'),
        const SizedBox(
          height: 10,
        ),
        totalAmount(
          extrasTotal: checkoutLoadedState.extrasTotal(),
          cartTotal: cartLoadedState.total,
          shippingCost: double.parse(
            '${checkoutLoadedState.deliveryTime.price ?? 0}',
          ),
        ),
      ],
    );
  }

  // }

  Widget productList(CartLoadedState state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state.cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(state.cartItems[index].product.title ?? ''),
              trailing: Text('X  ${state.cartItems[index].quantity}'),
            ),
            const Divider(), //                           <-- Divider
          ],
        );
      },
    );
  }

  Widget extraCartList(CheckoutLoadedState state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state.extras.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(state.extras[index].extra.name ?? ''),
              trailing: Text('X  ${state.extras[index].quantity}'),
            ),

            const Divider(), //                           <-- Divider
          ],
        );
      },
    );
  }

  Widget totalAmount({
    required double extrasTotal,
    required double cartTotal,
    required double shippingCost,
  }) {
    return Column(
      children: [
        ListTile(
          title: const Text('Shop Total'),
          trailing: Text(
            formatCurrency.format(
              cartTotal,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text('Extras Total'),
          trailing: Text(
            formatCurrency.format(
              extrasTotal,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text('Shipping Total'),
          trailing: Text(
            formatCurrency.format(
              shippingCost,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text('Sub Total'),
          trailing: Text(
            formatCurrency.format(
              extrasTotal + cartTotal + shippingCost,
            ),
          ),
        ),
      ],
    );
  }
}
