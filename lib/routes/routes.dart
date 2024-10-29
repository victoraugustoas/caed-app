import 'package:caed_app/screens/home/home_view.dart';
import 'package:caed_app/screens/home/widgets/home_tab_view.dart';
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

@TypedShellRoute<HomeShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeTabRoute>(path: '/home'),
    TypedGoRoute<OptionsTabRoute>(path: '/options'),
    TypedGoRoute<TutorialsTabRoute>(path: '/tutorials'),
  ],
)
@immutable
class HomeShellRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    // In the navigator, we get the current tab widget.
    return HomeShellView(child: navigator);
  }
}

class HomeTabRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const HomeTabView();
}

class OptionsTabRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Center(child: Text('Opções'));
}

class TutorialsTabRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Center(child: Text('Tutoriais'));
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
