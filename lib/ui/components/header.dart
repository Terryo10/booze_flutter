import 'package:flutter/material.dart';
import '../../responsive/responsive.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  get drawer => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Responsive.isMobile(context))
          Container()
        else if (Responsive.isDesktop(context))
          ...header()
        else if (Responsive.isTablet(context))
          Container()
      ],
    );
  }

  List<Widget> header() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: (() => Scaffold.of(context).openDrawer()),
                child: const Icon(Icons.menu_outlined)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  'BOOZE Liquor & Drinks',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(18.0))),
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 45,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueGrey[50]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const FittedBox(
                            child: Text(
                              'Delivery',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const FittedBox(
                            child: Text(
                              'Pick Up',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  hintText: 'Search Location',
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
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search Products',
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
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 45,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // context.navigateNamedTo('/login-page');
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Row(
                        children:  const[
                          Icon(Icons.shopping_cart),
                          Text(' 0 Cart'),
                        ],
                      ))),
            ),
          ],
        ),
      ),
      const Divider(
        height: 2,
      ),
    ];
  }
}
