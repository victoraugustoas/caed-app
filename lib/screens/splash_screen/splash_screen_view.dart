import 'package:caed_app/global/initializer.dart';
import 'package:caed_app/routes/routes.dart';
import 'package:caed_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenView extends ConsumerWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializerProvider, (_, state) {
      if (!state.isLoading) {
        if (context.mounted) {
          SigninRoute().pushReplacement(context);
        }
      }
    });

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.logo,
            width: 300,
          ),
          const SizedBox(height: 24),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
