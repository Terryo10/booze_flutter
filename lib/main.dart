import 'package:booze_flutter/locator.dart';
import 'package:booze_flutter/routes/router.gr.dart';
import 'package:booze_flutter/services/scoll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'app_blocs/app_repositories.dart';

import 'app_blocs/app_blocs.dart';

void main() {
  setupLocator();
  final _appRouter = AppRouter();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  var appConfig = AppRepositories(
    appBlocs: AppBlocs(
      app: MyApp(
        appRouter: _appRouter,
      ), storage: storage,
    ), storage: storage,
  );
  runApp(appConfig);
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var app = MaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Booze',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );

    return app;
  }
}
