import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title),
      ),
      body: Center(
        child: Switch(
          value: context.watch<ThemeCubit>().state.isDark,
          onChanged: (v) {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
      ),
    );
  }
}