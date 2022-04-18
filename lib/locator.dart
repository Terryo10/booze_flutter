import 'package:booze_flutter/services/authentication/auth_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
locator.registerSingleton<AuthService>(AuthService());
}