import 'package:flutter/material.dart';

class RecipientDetails extends StatefulWidget {
  const RecipientDetails({Key? key}) : super(key: key);

  @override
  State<RecipientDetails> createState() => _RecipientDetailsState();
}

class _RecipientDetailsState extends State<RecipientDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Expanded(child: textInput(name: 'Recipient Name')),
              const SizedBox(
                width: 5,
              ),
              Expanded(child: textInput(name: 'Zimbabwean Phone Number')),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textInput(name: 'Street Address'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: multilineInput(
              name: 'Additional Phone Number or Instructions',
            ),
          ),
        ],
      ),
    );
  }

  TextField textInput({required String name}) {
    return TextField(
      decoration: InputDecoration(
        hintText: name,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade50),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade50),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  TextField multilineInput({required String name}) {
    return TextField(
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: name,
        filled: true,
        fillColor: Colors.blueGrey[50],
        labelStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.only(left: 30),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade50),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey.shade50),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
