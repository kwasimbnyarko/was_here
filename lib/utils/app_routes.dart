import 'package:flutter/material.dart';
import 'package:was_here/details_pages/add_details_page.dart';
import 'package:was_here/details_pages/check_details.dart';
import 'package:was_here/details_pages/change_details.dart';
import 'package:was_here/splash/splash.dart';

class AppRouter {
  static const String viewDetailsPage = "/detailsPage";
  // static const String changeDetailsPage = '/changeDetialsPage';
  static const String splashScreen = '/splash';
  static const String addDetailsPage = '/addDetailsPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case viewDetailsPage:
        return MaterialPageRoute(
            builder: (context) => ViewDetailsPage(), settings: settings);
      // case changeDetailsPage:
      //   return MaterialPageRoute(
      //       builder: (context) => ChangeDetailsPage(), settings: settings);
      case addDetailsPage:
        return MaterialPageRoute(
            builder: (context) => AddDetailsPage(), settings: settings);
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
  // Future<void> editDetails() => pushNamed(AppRouter.detailsPage);
  Future<void> addDetails() => pushNamed(AppRouter.addDetailsPage);
  // Future<void> viewDetails() => pushNamed(AppRouter.detailsPage);

}
