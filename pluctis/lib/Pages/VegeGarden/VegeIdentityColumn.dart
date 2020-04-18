import 'package:flutter/material.dart';
import 'package:pluctis/Models/Vegetable.dart';
import 'package:pluctis/Widgets/ItemsTitleCard.dart';
import 'package:pluctis/Widgets/VegeGarden/Calendar/VegeCalendar.dart';
import 'package:provider/provider.dart';

class VegeIdentityColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Vegetable>(
      builder: (context, vegetable, child) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Identite", style: Theme.of(context).textTheme.title,),
              ItemsTitleCard(
                imageSource: "assets/images/vegetables/${vegetable.slug}.png",
                titles: [
                  "Nom",
                  "Prochaine étape"
                ],
                contents: [
                  vegetable.name,
                  "Semi (155 jours)"
                ],
              ),

              VegeCalendar(
                tileHeight: 24,
                tileWidth: 18,
                labelWidth: 64,
                sowMonths: vegetable.sowMonths,
                plantationMonths: vegetable.plantMonths,
                harvestMonths: vegetable.harvestMonths,
              )
            ],
          ),
        );
      },
    );
  }
}