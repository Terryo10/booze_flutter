import 'package:booze_flutter/models/checkout/address.dart';
import 'package:booze_flutter/models/checkout/checkout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout_bloc/checkout_bloc.dart';

class RecipientDetails extends StatefulWidget {
  const RecipientDetails({Key? key}) : super(key: key);

  @override
  State<RecipientDetails> createState() => _RecipientDetailsState();
}

class _RecipientDetailsState extends State<RecipientDetails> {
  final recipientNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final streetAddressController = TextEditingController();
  final additionalInfoController = TextEditingController();
  Suburb? selectedSuburb;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutLoadedState) {
         
        }
      },
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoadedState) {
            return SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Expanded(
                        child: textInput(
                          name: 'Recipient Name (required)',
                          type: TextInputType.none,
                          formatters: [],
                          textEditingController: recipientNameController,
                          state: state,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: textInput(
                          name: 'Zimbabwean Phone Number (required)',
                          type: TextInputType.number,
                          formatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textEditingController: phoneNumberController,
                          state: state,
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textInput(
                      name: 'Street Address (required)',
                      type: TextInputType.none,
                      formatters: [],
                      textEditingController: streetAddressController,
                      state: state,
                    ),
                  ),
                  DropdownButton<Suburb>(
                    hint: selectedSuburb == null
                        ? const Text('Select Your Suburb (required) ')
                        : Text(
                            selectedSuburb?.name ?? '',
                          ),
                    items: state.checkoutModel.suburbs!.map((Suburb value) {
                      return DropdownMenuItem<Suburb>(
                        value: value,
                        child: Text(value.name ?? ''),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // selectedSuburb
                      setState(() {
                        selectedSuburb = value;
                      });
                      changeTextState(state);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: multilineInput(
                      state: state,
                      name:
                          'Additional Phone Number or Instructions E.G bring me 20 dollars change',
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  void changeTextState(CheckoutLoadedState state) {
    BlocProvider.of<CheckoutBloc>(context).add(
      AddAddress(
        address: Address(
          street: streetAddressController.text,
          phoneNumber: phoneNumberController.text,
          name: recipientNameController.text,
          cityId: selectedSuburb?.id ?? 1,
          additionalInfo: additionalInfoController.text,
        ),
        paymentMethod: state.paymentMethod,
        extraCart: state.extras,
        checkoutDetailsModel: state.checkoutModel,
        deliveryTime: state.deliveryTime
      ),
    );
  }

  TextField textInput({
    required String name,
    required TextInputType type,
    required List<TextInputFormatter> formatters,
    required TextEditingController textEditingController,
    required CheckoutLoadedState state,
  }) {
    return TextField(
      controller: textEditingController,
      keyboardType: type,
      inputFormatters: formatters,
      onChanged: (value) {
        changeTextState(state);
      },
      decoration: InputDecoration(
        labelText: name,
        hintText: name,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  TextField multilineInput(
      {required String name, required CheckoutLoadedState state}) {
    return TextField(
      onChanged: (value) {
        changeTextState(state);
      },
      controller: additionalInfoController,
      keyboardType: TextInputType.multiline,
      minLines: 10,
      maxLines: 10,
      decoration: InputDecoration(
        hintText: name,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(30),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
