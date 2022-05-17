import 'package:booze_flutter/responsive/responsive.dart';
import 'package:booze_flutter/ui/body_builder.dart';
import 'package:booze_flutter/ui/checkout/extras.dart';
import 'package:booze_flutter/ui/checkout/payments/payments.dart';
import 'package:booze_flutter/ui/checkout/recipient_details.dart';
import 'package:flutter/material.dart';

import '../components/header.dart';

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
          content: const RecipientDetails()),
      Step(
          isActive: currentStep >= 4,
          title: const FittedBox(child: Text('Confirm Order')),
          content: const RecipientDetails()),
    ];
  }

  SingleChildScrollView checkoutBody() {
    int isFirstStep = 0;
    int isLastStep = steps().length - 1;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stepper(
                type: Responsive.isMobile(context)
                    ? StepperType.vertical
                    : StepperType.horizontal,
                steps: steps(),
                currentStep: currentStep,
                onStepContinue: () {
                  if (isLastStep == currentStep) {
                  } else {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },
                onStepCancel: () {
                  if (currentStep == isFirstStep) {
                  } else {
                    setState(() {
                      currentStep -= 1;
                    });
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
