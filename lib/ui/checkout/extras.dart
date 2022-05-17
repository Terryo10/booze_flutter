import 'package:flutter/material.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    return buildList(extras: radios);
  }

  Widget buildList({required List<String> extras}) {
    var list = extras;
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return expertiseCard(list[index]);
        });
  }

  Widget expertiseCard(String radios) {
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
                        radios,
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
                children: [
                  Radio<String>(
                    value: radios,
                    groupValue: selectedRadio,
                    activeColor: Colors.green,
                    onChanged: (value) {},
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
