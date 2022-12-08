import 'package:flutter/material.dart';
import 'package:styli_assignment/model/country_model.dart';
import 'package:styli_assignment/router/route_paths.dart';
import 'package:styli_assignment/views/country_details.dart';
import 'package:styli_assignment/views/country_list.dart';
import 'package:styli_assignment/views/error_screen.dart';
import 'package:styli_assignment/views/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePaths.splash:
      return MaterialPageRoute(
          builder: (_) => const Splash(), settings: settings);
    case RoutePaths.countryList:
      return MaterialPageRoute(
          builder: (_) => CountryList(
              countryList: settings.arguments as List<CountryModel>),
          settings: settings);
    case RoutePaths.countryDetails:
      return MaterialPageRoute(
          builder: (_) => CountryDetails(
              countryDetails: settings.arguments as CountryModel),
          settings: settings);
    default:
      return MaterialPageRoute(builder: (_) => const GenericError());
  }
}
