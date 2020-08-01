import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /***
     * Pegando valores da rota,
     * Fazendo um cast do tipo de objetos para o tipo MEAL
     *  */

    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoNavigationBarBackButton(
                previousPageTitle: meal.title,
              ),
            ),
            child: Center(
              child: Text('Detalhes da Refeição!'),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(meal.title),
            ),
            body: Center(
              child: Text('Detalhes da Refeição'),
            ),
          );
  }
}
