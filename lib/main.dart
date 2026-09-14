/*import 'package:flutter/material.dart';
import 'package:flutter_pro1/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pro1/app_router.dart';
import 'package:flutter_pro1/app_theme.dart';
import 'package:flutter_pro1/theme_cubit.dart';
import 'package:flutter_pro1/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,

            theme: state.isDark
                ? AppTheme().darktheme()
                : AppTheme().lighttheme(),

            routerConfig: AppRouter.appRouter,
          );
        },
      ),
    );
  }
}