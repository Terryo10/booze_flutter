import 'package:flutter/material.dart';

class RecipientDetails extends StatefulWidget {
  const RecipientDetails({ Key? key }) : super(key: key);

  @override
  State<RecipientDetails> createState() => _RecipientDetailsState();
}

class _RecipientDetailsState extends State<RecipientDetails> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child:  Text('Recipient tab'),
    );
  }
}