import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/injections/dependency_injections.dart';
import 'core/navigation/app_routes.dart';
import 'core/themes/app_theme.dart';
import 'presentation/bloc/student_bloc.dart';

void main() {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: BlocProvider(
        create: (_) => sl<StudentBloc>(),
        child: MaterialApp.router(
          title: 'MyAsa',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          routerConfig: AppRoutes.configuration,
        ),
      ),
    );
  }
}