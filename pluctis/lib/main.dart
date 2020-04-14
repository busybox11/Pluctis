import 'package:flutter/material.dart';
import 'package:pluctis/Models/ApplicationStyle.dart';
import 'package:pluctis/Models/PlantsList.dart';
import 'package:pluctis/Pages/MainPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => new ApplicationStyle()),
        ChangeNotifierProvider(create: (context) => new PlantsList()),
      ],
      child: Consumer<ApplicationStyle>(
        builder: (context, applicationStyle, child) {
          return MaterialApp(
            title: 'Pluctis',
            theme: ThemeData(
              brightness: applicationStyle.brightness,
              
              scaffoldBackgroundColor: applicationStyle.scaffoldColor,
              cardColor: applicationStyle.cardColor,
              primaryColor: applicationStyle.primaryColor,
              accentColor: applicationStyle.accentColor,

              cardTheme: CardTheme(
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: applicationStyle.cardColor,
                margin: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16)
              ),

              appBarTheme: AppBarTheme(
                color: applicationStyle.scaffoldColor,
                elevation: 0,
              ),

              textTheme: TextTheme(
                title: TextStyle(fontSize: 54.0, fontFamily: 'NanumBrushScript', fontStyle: FontStyle.italic, color: applicationStyle.brightness == Brightness.light ? Colors.black87 : Colors.white),
                headline: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, color: applicationStyle.brightness == Brightness.light ? Colors.black87 : Colors.white),
                subhead: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: applicationStyle.brightness == Brightness.light ? Colors.black87 : Colors.white),
                body1: TextStyle(fontSize: 14.0),
              ),
            ),
            home: MainPage()
          );
        }
      )
    );
  }
}