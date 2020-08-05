import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/components/category_item.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  final bodyPage = GridView(
    // permiter gerar scroll vertical
    padding: const EdgeInsets.all(25),
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
    children: DUMMY_CATEGORIES.map((cat) {
      // criando uma lista<Widget> do tipo CategoryItem
      return CategoryItem(cat);
    }).toList(),
  );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: bodyPage,
          )
        : Scaffold(
            body: bodyPage,
          );
  }
}
