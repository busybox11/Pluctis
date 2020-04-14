import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({Key key, 
                   @required this.icons,
                   @required this.titles,
                   @required this.contents,
  }) : assert(titles.length == contents.length);
  
  final List<String> icons;
  final List<String> titles;
  final List<String> contents;

  @override
  Widget build(BuildContext context) {    
    return Card(
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: SvgPicture.asset(
                'assets/svg/${icons[index]}.svg',
                semanticsLabel: "Icon",
                height: 32,
              ),
              title: Text(titles[index]), 
              subtitle: Text(contents[index]),
            );
            // return Text(titles[index]);
          } 
        ),
      ),
    );
  }
}