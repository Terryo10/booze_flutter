import 'package:booze_flutter/responsive/responsive.dart';
import 'package:booze_flutter/ui/body_builder.dart';
import 'package:booze_flutter/ui/checkout/delivery.dart';
import 'package:booze_flutter/ui/checkout/extras.dart';
import 'package:booze_flutter/ui/checkout/payments/payments.dart';
import 'package:booze_flutter/ui/checkout/recipient_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/checkout_bloc/checkout_bloc.dart';
import '../components/app_main_button.dart';
import '../components/header.dart';
import 'order_confirmation.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return BodyBuilder(body: checkoutBody());
  }

  List<Step> steps() {
    return [
      Step(
          isActive: currentStep >= 0,
          title: const FittedBox(child: Text('Extras')),
          content: const Extras()),
      Step(
          isActive: currentStep >= 1,
          title: const FittedBox(child: Text('Recipient Details')),
          content: const RecipientDetails()),
      Step(
          isActive: currentStep >= 2,
          title: const FittedBox(child: Text('Choose Payment')),
          content: const Payments()),
      Step(
          isActive: currentStep >= 3,
          title: const FittedBox(child: Text('Delivery Times')),
          content: const Delivery()),
      Step(
          isActive: currentStep >= 4,
          title: const FittedBox(child: Text('Confirm Order')),
          content: const OrderConfirmation()),
    ];
  }

  SingleChildScrollView checkoutBody() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CheckoutLoadedState) {
            return Column(
              children: [
                const Header(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Theme(
                      data: ThemeData(
                        colorScheme:
                            const ColorScheme.light(primary: Colors.black),
                      ),
                      child: Stepper(
                        type: Responsive.isMobile(context)
                            ? StepperType.vertical
                            : StepperType.horizontal,
                        steps: steps(),
                        currentStep: currentStep,
                        onStepContinue: () {
                          stepNext(state: state);
                        },
                        onStepCancel: () {
                          stepBack();
                        },
                        controlsBuilder:
                            (context, ControlsDetails controlsDetails) {
                          List<Widget> buttons = [];
                          if (controlsDetails.stepIndex == 0) {
                            buttons = [
                              SizedBox(
                                width: 200,
                                child: AppMainButton(
                                    onTap: () {
                                      controlsDetails.onStepContinue!();
                                    },
                                    text: 'Continue'),
                              ),
                            ];
                          } else{
                            buttons = [
                              SizedBox(
                                width: Responsive.isMobile(context) ? 100 : 200,
                                child: AppMainButton(
                                  onTap: () {
                                    controlsDetails.onStepCancel!();
                                  },
                                  text: 'Go Back',
                                ),
                              ),
                              SizedBox(
                                width: Responsive.isMobile(context) ? 100 : 200,
                                child: AppMainButton(
                                  onTap: () {
                                    controlsDetails.onStepContinue!();
                                  },
                                  text: 'Continue',
                                ),
                              ),
                            ];
                          }
                          return Row(
                            children: [...buttons],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(child: Text('oops something happened retry'));
        },
      ),
    );
  }

  void stepNext({required CheckoutLoadedState state}) {
    //notice steps and avoid continity
    int isLastStep = steps().length - 1;
    if (isLastStep == currentStep) {
    } else if (currentStep == 1) {
      //address details
      if (state.address.name.isNotEmpty &&
          state.address.phoneNumber.isNotEmpty &&
          state.address.street.isNotEmpty &&
          state.address.cityId != null) {
        RegExp regExp = RegExp(r'(\+263|0)7[7-8|1|3][0-9]{7}$');
        if (regExp.hasMatch(state.address.phoneNumber)) {
          setState(() {
            currentStep += 1;
          });
          //procced
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Please enter a valid phone number ',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      } else {
        //do nothing
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Fill in mandatory fields to proceed ',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } else {
      setState(() {
        currentStep += 1;
      });
    }
  }

  void stepBack() {
    int isFirstStep = 0;
    if (currentStep == isFirstStep) {
    } else {
      setState(() {
        currentStep -= 1;
      });
    }
  }
}
