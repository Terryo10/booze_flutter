import 'package:auto_route/annotations.dart';
import '../ui/auth/login.dart';
import '../ui/landing_page.dart';
import '../ui/auth/register.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: RegisterPage),
  ],
)
class $AppRouter {}