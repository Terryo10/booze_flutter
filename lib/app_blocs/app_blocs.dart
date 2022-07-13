import 'package:booze_flutter/bloc/cache_bloc/cache_bloc.dart';
import 'package:booze_flutter/bloc/cart_bloc/cart_bloc.dart';
import 'package:booze_flutter/repositories/auth/authentication_repository.dart';
import 'package:booze_flutter/repositories/cache_repository/cache_repository.dart';
import 'package:booze_flutter/repositories/categories_repository/categories_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/categories/categories_bloc.dart';
import '../bloc/checkout_bloc/checkout_bloc.dart';
import '../repositories/checkout/checkout_repository.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  final FlutterSecureStorage storage;

  const AppBlocs({Key? key, required this.app, required this.storage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => AuthBloc(
            authRepository:
                RepositoryProvider.of<AuthenticationRepository>(context)),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => CacheBloc(
            authBloc: BlocProvider.of<AuthBloc>(context),
            cacheRepository: RepositoryProvider.of<CacheRepository>(context)),
      ),
      BlocProvider(
        create: (context) => CategoriesBloc(
            categoriesRepository:
                RepositoryProvider.of<CategoriesRepository>(context))
          ..add(
            GetCategoriesEvent(),
          ),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => CartBloc(storage)
          ..add(
            CartStarted(),
          ),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => CheckoutBloc(
          cartBloc: BlocProvider.of<CartBloc>(context),
          checkoutRepository:
              RepositoryProvider.of<CheckoutRepository>(context),
        )..add(
          GetcheckoutDetailsEvent(),
        ),
        lazy: false,
      ),
    ], child: app);
  }
}
