import 'package:flutter/material.dart';
import 'package:pluctis/BottomNavigation.dart';
import 'package:pluctis/Pages/DashboardPage.dart';
import 'package:pluctis/Pages/Plants/FindPlantPage.dart';
import 'package:pluctis/Pages/Plants/PlantsPage.dart';
import 'package:pluctis/Pages/Settings/SettingsPage.dart';
import 'package:pluctis/Pages/VegeGarden/FindVegetablePage.dart';
import 'package:pluctis/Pages/VegeGarden/VegeGardenPage.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String addPlantFindPage = "/addPlantFindPage";
  static const String addVegetableFindPage = "/addVegetableFindPage";
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {String destinationPage}) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders['/' + destinationPage](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    // return {
    //   TabNavigatorRoutes.root: (context) => MorningPage(),
    //   TabNavigatorRoutes.morning: (context) => MorningPage(),
    //   TabNavigatorRoutes.reminders: (context) => RemindersPage(),
    //   TabNavigatorRoutes.tenWordsPage: (context) => TenWordsPage(),
    // };

    if (tabItem == TabItem.plants) {
      return {
        TabNavigatorRoutes.root: (context) => PlantsPage(
          onPush: (destinationPage) => _push(context, destinationPage: destinationPage),
        ),
        TabNavigatorRoutes.addPlantFindPage: (context) => FindPlantPage(),
      };
    }

    if (tabItem == TabItem.vege_garden) {
      return {
        TabNavigatorRoutes.root: (context) => VegeGardenPage(
          onPush: (destinationPage) => _push(context, destinationPage: destinationPage),
        ),
        TabNavigatorRoutes.addVegetableFindPage: (context) => FindVegetablePage(),
      };
    }

    if (tabItem == TabItem.settings) {
      return {
        TabNavigatorRoutes.root: (context) => SettingsPage(),
      };
    }

    return {
      TabNavigatorRoutes.root: (context) => DashboardPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
