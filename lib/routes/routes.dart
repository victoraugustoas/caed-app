import 'package:caed_app/screens/home/home_view.dart';
import 'package:caed_app/screens/package_detail/view/package_detail_view.dart';
import 'package:caed_app/screens/signin/signin_view.dart';
import 'package:caed_app/screens/splash_screen/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part "routes.g.dart";

@TypedGoRoute<SplashScreenRoute>(path: '/splash')
@immutable
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreenView();
  }
}

@TypedGoRoute<SigninRoute>(path: '/signin')
@immutable
class SigninRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SigninView();
  }
}

@TypedGoRoute<HomeRoute>(path: '/home')
@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeView();
  }
}

@TypedGoRoute<PackageDetailRoute>(path: '/package/:code/detail')
@immutable
class PackageDetailRoute extends GoRouteData {
  final String code;
  const PackageDetailRoute({required this.code});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PackageDetailView(code: code);
  }
}
