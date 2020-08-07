import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/components/meal_card_info.dart';

class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /***
     * Pegando valores da rota,
     * Fazendo um cast do tipo de objetos para o tipo MEAL
     *  */

    final meal = ModalRoute.of(context).settings.arguments as Meal;

    Widget _createSectionTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
    }

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
            body: SingleChildScrollView(
              // SingleChildScrollView gera um scroll horizontal para evitar overflow
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _createSectionTitle(context, 'Ingredientes'),
                  MealCardInfo(
                    listViewBuild: ListView.builder(
                      itemCount: meal.ingredients.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Card(
                            child: Text(meal.ingredients[index]),
                            color: Theme.of(context).accentColor,
                          ),
                        );
                      },
                    ),
                  ),
                  _createSectionTitle(context, 'Passos'),
                  MealCardInfo(
                    listViewBuild: ListView.builder(
                      itemCount: meal.steps.length,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('${index + 1} '),
                              ),
                              title: Text(meal.steps[index]),
                            ),
                            Divider(), // add linha para dividir um passo do outro
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.star),
                onPressed: () {
                  Navigator.of(context).pop(meal.title);
                }),
          );
  }
}
