import 'package:caed_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShellView extends StatefulWidget {
  final Widget child;

  const HomeShellView({
    super.key,
    required this.child,
  });

  @override
  State<HomeShellView> createState() => _HomeShellViewState();
}

class _HomeShellViewState extends State<HomeShellView> {
  int getCurrentIndex() {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(HomeTabRoute().location)) {
      return 0;
    } else if (location.startsWith(OptionsTabRoute().location)) {
      return 1;
    }
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          switch (index) {
            case 0:
              HomeTabRoute().push(context);
              break;
            case 1:
              OptionsTabRoute().push(context);
              break;
            case 2:
              TutorialsTabRoute().push(context);
              break;
          }
        },
        indicatorColor: Colors.blue.shade100,
        selectedIndex: getCurrentIndex(),
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Opções',
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Tutoriais',
          ),
        ],
      ),
    );
  }
}
