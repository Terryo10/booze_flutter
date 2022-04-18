import 'package:booze_flutter/repositories/auth/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../bloc/auth/auth_bloc.dart';
import '../bloc/categories/categories_bloc.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  final FlutterSecureStorage storage;

  const AppBlocs({Key? key, required this.app, required this.storage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: ((context) => AuthBloc(
              authRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            )),
        lazy: false,
      ),
      BlocProvider(
        create: ((context) => CategoriesBloc()),
      ),
    ], child: app);
  }
}
