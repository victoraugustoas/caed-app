import 'package:caed_app/routes/routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SplashScreenRoute().location,
  routes: $appRoutes,
);
