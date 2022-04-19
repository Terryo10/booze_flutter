import 'package:booze_flutter/repositories/auth/authentication_provider.dart';

import '../../models/auth/auth_model.dart';

class AuthenticationRepository {

  final AuthenticationProvider provider;

  AuthenticationRepository({required this.provider});

  Future<AuthModel> login(
      {required String email, required String password}) async {
    var data = await provider.login(email: email, password: password);
    final authModel = authModelFromJson(data);
    return authModel;
  }

  Future<AuthModel> register(
      {required String email, required String password, required String name}) async {
    var data = await provider.login(email: email, password: password);
    final authModel = authModelFromJson(data);
    return authModel;
  }
}
