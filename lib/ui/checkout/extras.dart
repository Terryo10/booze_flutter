import 'dart:math';

import 'package:booze_flutter/models/checkout/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout_bloc/checkout_bloc.dart';

class Extras extends StatefulWidget {
  const Extras({Key? key}) : super(key: key);

  @override
  State<Extras> createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {
  String selectedRadio = 'Extra';
  List<String> radios = [
    'Ice',
    'Tonic',
    'Cranbery',
    'Coke',
    'Water',
    'Lemonade',
    'Ice',
    'Tonic',
    'Cranbery',
    'Coke',
    'Water',
    'Lemonade',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoadedState) {
          return buildList(extras: state.checkoutModel.extras);
        }
        return Container();
      },
    );
  }

  Widget buildList({required List<Extra>? extras}) {
    var list = extras ?? [];
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return extrasCard(list[index]);
        });
  }

  Widget extrasCard(Extra extra) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        extra.name ?? '',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [Text('cart')],
              ),
            )
          ],
        ),
      ),
    );
  }
}
