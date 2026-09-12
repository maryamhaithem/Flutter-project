import 'package:go_router/go_router.dart';

import 'package:flutter_pro1/login_screen.dart';
import 'package:flutter_pro1/signup_screen.dart';
import 'package:flutter_pro1/routes.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter appRouter = GoRouter(
    initialLocation: '/login',

    routes: [
      GoRoute(
        path: '/login',
        name: Routes.loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        path: '/signup',
        name: Routes.signUpScreen,
        builder: (context, state) {
          return SignUpScreen();
        },
      ),


    ],
  );
}