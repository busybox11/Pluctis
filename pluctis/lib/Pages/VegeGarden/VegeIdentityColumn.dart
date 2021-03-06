import 'package:flutter/material.dart';
import 'package:pluctis/Helpers/TimelineHelper.dart';
import 'package:pluctis/Models/Vegetable.dart';
import 'package:pluctis/Widgets/ItemsCard.dart';
import 'package:pluctis/Widgets/ItemsTitleCard.dart';
import 'package:pluctis/Widgets/PluctisTitle.dart';
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
              PluctisTitle(title: "Identité"),
              ItemsTitleCard(
                imageSource: "assets/images/vegetables/${vegetable.slug}.png",
                titles: [
                  vegetable.name,
                  "Les étapes"
                ],
                contents: [
                  "Nom",
                  " • Actuellement : ${vegetable.currentState}\n • Prochaine étape : ${TimelineHelper.instance.vegetableNextState(vegetable)}"
                ],
              ),
              
              ItemsCard(
                icons: ["vegetables"],
                titles: ["Description"],
                contents: [vegetable.description],
              ),

              VegeCalendar(
                tileHeight: 20,
                tileWidth: 14,
                labelWidth: 64,
                sowMonths: vegetable.sowMonths,
                plantationMonths: vegetable.plantMonths,
                harvestMonths: vegetable.harvestMonths,
              ),

              SizedBox(height: 64,)
            ],
          ),
        );
      },
    );
  }
}