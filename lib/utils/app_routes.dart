import 'package:flutter/material.dart';
import 'package:was_here/details_pages/check_details.dart';
import 'package:was_here/details_pages/change_details.dart';
import 'package:was_here/splash/splash.dart';

class AppRouter {
  static const detailsPage = "/detailsPage";
  static const changeDetailsPage = '/changeDetialsPage';
  static const splashScreen = '/splash';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);
      case detailsPage:
        return MaterialPageRoute(
            builder: (context) => DetailsPage(), settings: settings);
      case changeDetailsPage:
        return MaterialPageRoute(
            builder: (context) => ChangeDetailsPage(), settings: settings);
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
  Future<void> viewDetails() => pushNamed(AppRouter.detailsPage);
  Future<void> editDetails() => pushNamed(AppRouter.detailsPage);
  // Future<void> viewDetails() => pushNamed(AppRouter.detailsPage);

}
