import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class DrenApp extends StatelessWidget {
  const DrenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dren',
      debugShowCheckedModeBanner: false,
      theme: DrenTheme.darkTheme,
      routerConfig: goRouter,
    );
  }
}
