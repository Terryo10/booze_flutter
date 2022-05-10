// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:booze_flutter/ui/auth/login.dart' as _i2;
import 'package:booze_flutter/ui/auth/register.dart' as _i3;
import 'package:booze_flutter/ui/checkout/checkout.dart' as _i4;
import 'package:booze_flutter/ui/landing_page.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    LoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    },
    Checkout.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.Checkout());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LandingRoute.name, path: '/'),
        _i5.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i5.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i5.RouteConfig(Checkout.name, path: '/Checkout')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i5.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.Checkout]
class Checkout extends _i5.PageRouteInfo<void> {
  const Checkout() : super(Checkout.name, path: '/Checkout');

  static const String name = 'Checkout';
}
