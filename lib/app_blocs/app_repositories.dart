import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../repositories/auth/authentication_provider.dart';
import '../repositories/auth/authentication_repository.dart';

class AppRepositories extends StatelessWidget {
  final Widget appBlocs;
  final FlutterSecureStorage storage;

  const AppRepositories(
      {Key? key, required this.appBlocs, required this.storage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(
            provider: AuthenticationProvider(storage: storage),
          ),
        ),
      ],
      child: appBlocs,
    );
  }
}
