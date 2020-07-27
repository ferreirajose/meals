import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/catergory.dart';
import 'package:meals/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  // final router = Platform.isIOS
  //     ? CupertinoPageRoute(builder: (_) {
  //         return CategoriesMealsScreen(this.category);
  //       })
  //     : MaterialPageRoute(builder: (_) {
  //         return CategoriesMealsScreen(this.category);
  //       });

  void _selectCategory(BuildContext context) {
    /**
     * @TODO
     * Cannot install a MaterialPageRoute<dynamic> after disposing it.
     * Esse erro acima pode ocorrer quando se navegar para outras telas, 
     * o problemas acontece depois de um certo tempo
     *  */

    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return CategoriesMealsScreen(this.category);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context)
          .primaryColor, // Cor de bag quado for pressionado um card na tela
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
      ),
    );
  }
}
