import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';

import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  const FavoriteScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Center(
        child: Text('Nenhuma Refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoritesMeal[index]);
        },
      );
    }
  }
}
