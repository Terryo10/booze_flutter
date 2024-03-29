import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout_bloc/checkout_bloc.dart';
import '../../models/checkout/checkout_model.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String? selectedRadio;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoadedState) {
          selectedRadio = state.deliveryTime.title ?? '';
        }
      },
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoadedState) {
            return buildList(
                deliveryTimes: state.checkoutModel.deliveryTimes, state: state,);
          }
          return Container();
        },
      ),
    );
  }

  Widget buildList(
      {required List<DeliveryTime>? deliveryTimes,
      required CheckoutLoadedState state}) {
    var list = deliveryTimes ?? [];
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return deliveryCard(list[index], state);
        });
  }

  Widget deliveryCard(DeliveryTime deliveryTime, CheckoutLoadedState state) {
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
                      Expanded(
                        child: Text(
                          '${deliveryTime.title} ${deliveryTime.type} Price: \$${deliveryTime.price}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
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
                    value: deliveryTime.title ?? '',
                    groupValue: selectedRadio,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      selectedRadio = value;
                      BlocProvider.of<CheckoutBloc>(context).add(
                        AddDeliveryTime(
                          address: state.address,
                          paymentMethod: state.paymentMethod,
                          extraCart: state.extras,
                          deliveryTime: deliveryTime,
                          checkoutDetailsModel: state.checkoutModel,
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
