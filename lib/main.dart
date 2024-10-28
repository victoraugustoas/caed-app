import 'package:caed_app/global/initializer.dart';
import 'package:caed_app/global/router/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: CaedApp()));
}

class CaedApp extends ConsumerStatefulWidget {
  const CaedApp({super.key});

  @override
  ConsumerState<CaedApp> createState() => _CaedAppState();
}

class _CaedAppState extends ConsumerState<CaedApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initializer = ref.read(initializerProvider.notifier);
      initializer.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    );
  }
}
