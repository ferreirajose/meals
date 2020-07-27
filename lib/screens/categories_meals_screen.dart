import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/catergory.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Category category;

  const CategoriesMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
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
            body: Center(
              child: Text('Receitas por Categorias ${category.id}'),
            ),
          );
  }
}
