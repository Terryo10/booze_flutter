import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({ Key? key }) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  String selectedRadio = 'Extra';
  List<String> radios = [
    'Express Today 30minutes to you (\$ 2.00)',
    '1 hour to you  (\$ 1.00)',
    '3 days to you  (\$ 0.50)',
    
  
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
                      FittedBox(
                        child: Text(
                          radios,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
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