import 'package:go_router/go_router.dart';

import '../../presentation/pages/login_page.dart';
import '../constants/routes.dart';

abstract class AppRoutes {

  static final configuration = GoRouter(
    initialLocation: Routes.auth,
    routes: [
      GoRoute(
        path: Routes.auth,
        builder: (context, state) => const LoginPage(),
      ),
    ]
  );
}