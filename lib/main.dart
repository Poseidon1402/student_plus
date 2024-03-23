import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/navigation/app_routes.dart';
import 'core/themes/app_theme.dart';

void main() {
  // setup();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyAsa',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: AppRoutes.configuration,
    );
  }
}