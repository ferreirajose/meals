import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meals/models/catergory.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    // passando a categorias por parametro na rota, utilizando rotas nomeadas
    Navigator.of(context).pushNamed(
      AppRouter.CATEGORIES_MEALS,
      arguments:
          category, // pode ser passar qualquer tipos de parametros, Lista, Object, Tipo Primitivos
    );
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
