import 'package:booze_flutter/locator.dart';
import 'package:booze_flutter/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_blocs/app_blocs.dart';

void main() {
  setupLocator();
  final _appRouter = AppRouter();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  runApp(MyApp(
    appRouter: _appRouter,
    storage: storage,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final FlutterSecureStorage storage;
  const MyApp({Key? key, required this.appRouter, required this.storage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var app = MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Booze',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );

    return AppBlocs(
      app: app,
      storage: storage,
    );
  }
}
