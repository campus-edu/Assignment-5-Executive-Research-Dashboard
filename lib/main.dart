import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'views/assignment4_view.dart';
import 'views/assignment5_view.dart';
import 'views/hub_view.dart';

void main() {
  runApp(const QuickBiteApp());
}

class QuickBiteApp extends StatelessWidget {
  const QuickBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickBite Technologies // C-Suite Portals',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainNavigationController(),
    );
  }
}

class MainNavigationController extends StatefulWidget {
  const MainNavigationController({super.key});

  @override
  State<MainNavigationController> createState() =>
      _MainNavigationControllerState();
}

class _MainNavigationControllerState extends State<MainNavigationController> {
  // 0: Master Hub, 1: Assignment 4, 2: Assignment 5
  int _activeRoute = 0;

  void _navigateTo(int route) {
    setState(() {
      _activeRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_activeRoute) {
      case 1:
        return Assignment4View(onBackToHub: () => _navigateTo(0));
      case 2:
        return Assignment5View(onBackToHub: () => _navigateTo(0));
      case 0:
      default:
        return HubView(
          onOpenAssignment4: () => _navigateTo(1),
          onOpenAssignment5: () => _navigateTo(2),
        );
    }
  }
}
