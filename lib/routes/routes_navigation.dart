import 'package:flutter/material.dart';
import 'package:it_info_partners/routes/routes_name.dart';
import 'package:it_info_partners/views/about_page.dart';
import 'package:it_info_partners/views/contact_page.dart';
import 'package:it_info_partners/views/home_page.dart';
import 'package:it_info_partners/views/services_page.dart';
import 'package:it_info_partners/views/programs_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case RouteNames.homePage:
        page = const HomePage();
        break;
      case RouteNames.aboutUs:
        page = const AboutPage();
        break;
      case RouteNames.services:
        page = const ServicesPage();
        break;
      case RouteNames.programs:
        page = const ProgramsPage();
        break;
      case RouteNames.contactUs:
        page = const ContactPage();
        break;
      default:
        page = Scaffold(body: Center(child: Text("No route configured for ${settings.name}")));
    }
    return PageRouteBuilder(settings: settings, pageBuilder: (_, _, _) => page, transitionDuration: Duration.zero, reverseTransitionDuration: Duration.zero);
  }
}
