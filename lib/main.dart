import 'package:flutter/material.dart';

import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesScreen(),
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'),
            ),
      ),
      routes: {
        // O / e assim como a propriedade home: CategoriesScreen(), initialRoute pode ser utilizado para carregar a tela inicial da aplicação
        AppRouter.HOME: (_) => CategoriesScreen(),
        AppRouter.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),
        AppRouter.MEALS_DETAIL: (_) => MealDetailScreen(),
      },
    );
  }
}
