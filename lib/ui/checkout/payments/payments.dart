import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/checkout_bloc/checkout_bloc.dart';
import '../../../models/checkout/checkout_model.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  String? selectedRadio;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoadedState) {
          selectedRadio = state.paymentMethod.name ?? '';
        }
      },
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoadedState) {
            return buildList(
                paymentMethods: state.checkoutModel.paymentMethods,
                checkoutLoadedState: state);
          }
          return Container();
        },
      ),
    );
  }

  Widget buildList(
      {required List<PaymentMethod>? paymentMethods,
      required CheckoutLoadedState checkoutLoadedState}) {
    var list = paymentMethods ?? [];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return paymentsCard(
          list[index],
          checkoutLoadedState: checkoutLoadedState,
        );
      },
    );
  }

  Widget paymentsCard(
    PaymentMethod paymentMethod, {
    required CheckoutLoadedState checkoutLoadedState,
  }) {
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
                        paymentMethod.name ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Radio<String>(
                    value: paymentMethod.name ?? '',
                    groupValue: selectedRadio,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      //add to bloc
                      BlocProvider.of<CheckoutBloc>(context).add(
                        AddPaymentMethod(
                          address: checkoutLoadedState.address,
                          paymentMethod: paymentMethod,
                          extraCart: checkoutLoadedState.extras,
                          checkoutDetailsModel:
                              checkoutLoadedState.checkoutModel,
                          deliveryTime: checkoutLoadedState.deliveryTime,
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
