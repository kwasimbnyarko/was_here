import 'package:flutter/material.dart';
import 'package:was_here/details_pages/add_details_page.dart';
import 'package:was_here/details_pages/view_details.dart';
import 'package:was_here/scan/scan_complete_page.dart';
import 'package:was_here/scan/scan_page.dart';

import 'package:was_here/splash/splash.dart';

import '../scan/scan_error_page.dart';

class AppRouter {
  static const String viewDetailsPage = "/detailsPage";

  static const String splashScreen = '/splash';
  static const String addDetailsPage = '/addDetailsPage';
  static const String scanPage = '/scanPage';
  static const String scanCompletePage = '/scanCompletePage';
  static const String scanErrorPage = '/scanErrorPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case viewDetailsPage:
        return MaterialPageRoute(
            builder: (context) => ViewDetailsPage(), settings: settings);
      case addDetailsPage:
        return MaterialPageRoute(
            builder: (context) => AddDetailsPage(), settings: settings);
      case scanPage:
        return MaterialPageRoute(
            builder: (context) => const ScanPage(), settings: settings);
      case scanCompletePage:
        return MaterialPageRoute(
            builder: (context) => const ScanCompletePage(), settings: settings);
      case scanErrorPage:
        return MaterialPageRoute(
            builder: (context) => const ScanErrorPage(), settings: settings);
    }
    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text("Route ${settings.name} not found"),
        ),
      ),
    );
  }
}

extension NavigatorStateExtension on NavigatorState {
  Future<void> viewDetails() => pushNamed(AppRouter.viewDetailsPage);
  Future<void> addDetails() => pushNamed(AppRouter.addDetailsPage);
  Future<void> scanPage() => pushNamed(AppRouter.scanPage);
  Future<void> scanCompletePage() => pushNamed(AppRouter.scanCompletePage);
  Future<void> scanErrorPage() => pushNamed(AppRouter.scanErrorPage);
}
