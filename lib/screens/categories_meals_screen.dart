import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/catergory.dart';

import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // pegando dados da categorias atraves das rotas
    final category = ModalRoute.of(context).settings.arguments
        as Category; // as Category fazeno cast dos arguments para o tipo Category

    /**
     * retorna a lista apenas com os elementos pertencentes a essa categoria
     * OBS: where é semelhante ao filter do JS
     * */

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: Center(
              child: Text('Receitas por Categorias ${category.id}'),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(category.title),
            ),
            body: ListView.builder(
              itemCount: categoryMeals.length,
              itemBuilder: (context, index) {
                return MealItem(categoryMeals[index]);
              },
            ),
          );
  }
}
