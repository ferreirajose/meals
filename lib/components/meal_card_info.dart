import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealCardInfo extends StatelessWidget {
  final Widget listViewBuild;
  MealCardInfo({this.listViewBuild});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 250,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: listViewBuild,
    );
  }
}
