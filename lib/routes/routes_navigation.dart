import 'package:flutter/material.dart';
import 'package:it_info_partners/routes/routes_name.dart';
import 'package:it_info_partners/views/about_page.dart';
import 'package:it_info_partners/views/contact_page.dart';
import 'package:it_info_partners/views/home_page.dart';
import 'package:it_info_partners/views/services_page.dart';
import 'package:it_info_partners/views/programs_page.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.homePage):
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
      case (RouteNames.aboutUs):
        return MaterialPageRoute(builder: (BuildContext context) => const AboutPage());
      case (RouteNames.services):
        return MaterialPageRoute(builder: (BuildContext context) => const ServicesPage());
      case (RouteNames.programs):
        return MaterialPageRoute(builder: (BuildContext context) => const ProgramsPage());
      case (RouteNames.contactUs):
        return MaterialPageRoute(builder: (BuildContext context) => const ContactPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Column(children: [Text("No route is configured")])),
          ),
        );
    }
  }
}
