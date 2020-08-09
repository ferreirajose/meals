import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';

import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = new Settings(); // o palavra chave new é opcional
  // Lista de refeições mocadas;
  List<Meal> _availabelMeal = DUMMY_MEALS;
  // Lista de refeições favoritadas pelo usuario;
  List<Meal> _favoriteMeals = [];
  // método para filtrar as refeições de acordo com os criterios definidos pelo usuario na tela de configurações
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availabelMeal = DUMMY_MEALS.where((meal) {
        // se o usuario marcou o filtro sem gluten e a camida tem gluten;
        final filterGlutten = settings.isGlutenFree && !meal.isGlutenFree;
        // se o usuario marcou o filtro sem lactose e a camida tem lactose;
        final filterLacotose = settings.isLactoseFree && !meal.isLactoseFree;
        // se o usuario marcou o filtro vegana e a camida não é vegana;
        final filterVegan = settings.isVegan && !meal.isVegan;
        // se o usuario marcou o filtro vegetariana e a camida não é vegetariana;
        final isVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutten &&
            !filterLacotose &&
            !filterVegan &&
            !isVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CategoriesScreen(), a inclusão desse parametro impede a exibição das tabs,
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
        AppRouter.HOME: (_) => TabsScreen(
              _favoriteMeals,
            ),
        AppRouter.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(
              this._availabelMeal,
            ),
        AppRouter.MEALS_DETAIL: (_) => MealDetailScreen(
              this._isFavorite,
              _toggleFavorite,
            ),
        AppRouter.SETTINGS: (_) => SettingsScreen(
              this.settings,
              this._filterMeals,
            ), // o palavra chave this é opcional, pode ser utilizado (this.settings ou settings)
      },
    );
  }
}
