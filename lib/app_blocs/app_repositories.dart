import 'package:booze_flutter/repositories/cache_repository/cache_repository.dart';
import 'package:booze_flutter/repositories/categories_repository/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../repositories/auth/authentication_provider.dart';
import '../repositories/auth/authentication_repository.dart';
import '../repositories/categories_repository/categories_repository.dart';

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
        RepositoryProvider(
            create: (context) => CacheRepository(storage: storage)),
        RepositoryProvider(
          create: (context) => CategoriesRepository(
            provider: CategoriesProvider(),
          ),
        )
      ],
      child: appBlocs,
    );
  }
}
