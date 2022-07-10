import 'package:booze_flutter/constants/app_strings/constants.dart';
import 'package:booze_flutter/models/checkout/checkout_model.dart';
import 'package:booze_flutter/models/checkout/extras_cart.dart';
import 'package:booze_flutter/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/checkout_bloc/checkout_bloc.dart';

class Extras extends StatefulWidget {
  const Extras({Key? key}) : super(key: key);

  @override
  State<Extras> createState() => _ExtrasState();
}

class _ExtrasState extends State<Extras> {
  String selectedRadio = 'Extra';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        if (state is CheckoutLoadedState) {
          return buildList(
              extras: state.checkoutModel.extras, extraCart: state.extras);
        }
        return Container();
      },
    );
  }

  Widget buildList(
      {required List<Extra>? extras, required List<ExtrasCart> extraCart}) {
    var list = extras ?? [];
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return extrasCard(extra: list[index]);
        });
  }

  Widget extrasCard({
    required Extra extra,
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
                child: SizedBox(
                  width: 41,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<CheckoutBloc, CheckoutState>(
                          builder: (context, state) {
                             if (state is CheckoutLoadedState) {
                            return InkWell(
                              onTap: () {
                                BlocProvider.of<CheckoutBloc>(context).add(
                                  RemoveExtras(
                                      checkoutDetailsModel: state.checkoutModel,
                                      extra: extra,
                                      extraCart: state.extras),
                                );
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
                            );}
                            return Container();
                          },
                          
                        ),
                        BlocListener<CheckoutBloc, CheckoutState>(
                          listener: (context, state) {
                            if (state is CheckoutLoadedState) {
                              
                            }
                          },
                          child: BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, state) {
                              if (state is CheckoutLoadedState) {
                                return Text(
                                    '${extraCount(extraId: extra.id, extras: state.extras)}');
                              } else {
                                return Text(
                                  '0',
                                  style: paragraph4,
                                );
                              }
                            },
                          ),
                        ),
                        BlocBuilder<CheckoutBloc, CheckoutState>(
                          builder: (context, state) {
                            if (state is CheckoutLoadedState) {
                              return InkWell(
                                onTap: () {
                                  BlocProvider.of<CheckoutBloc>(context).add(
                                    AddExtras(
                                        checkoutDetailsModel:
                                            state.checkoutModel,
                                        extra: extra,
                                        extraCart: state.extras),
                                  );
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
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  int extraCount({required int? extraId, required List<ExtrasCart> extras}) {
    if (extras.isNotEmpty) {
      for (var element in extras) {
        if (element.extra.id == extraId) {
          return element.quantity;
        }
      }
    }
   
    return 0;
  }
}
