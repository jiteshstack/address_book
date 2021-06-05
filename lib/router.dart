import 'package:address_book/pages/contact_details.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static const landingRoute = '/';
  static const contactDetails = '/contact/details';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final uriData = Uri.parse(settings.name);
  switch (uriData.path) {
    case AppRouter.contactDetails:
      return _getPageRoute(ContactDetails(name: settings.arguments), settings);
      break;
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
      break;
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) =>
    MaterialPageRoute(builder: (_) => child, settings: RouteSettings(name: settings.name));
