import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2, // informando a quantidade de tabs
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: Text('Vamos cozinhar'),
  //         bottom: TabBar(tabs: [
  //           Tab(
  //             icon: Icon(Icons.category),
  //             text: 'Categorias',
  //           ),
  //           Tab(
  //             icon: Icon(Icons.star),
  //             text: 'Favoritos',
  //           )
  //         ]),
  //       ),
  //       body: TabBarView(
  //         children: [
  //           CategoriesScreen(),
  //           FavoriteScreen(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screen = [
    {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
    {'title': 'Meus Favoritos', 'screen': FavoriteScreen()}
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[_selectedScreenIndex]['title']),
      ),
      body: _screen[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categorias'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favoritos'),
            )
          ]),
    );
  }
}
