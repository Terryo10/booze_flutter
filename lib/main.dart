import 'package:booze_flutter/locator.dart';
import 'package:booze_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  final _appRouter = AppRouter();
  runApp( MyApp(appRouter: _appRouter,));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Booze',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}