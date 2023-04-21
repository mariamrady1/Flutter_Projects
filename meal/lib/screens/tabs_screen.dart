import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  const TabsScreen(this._favoriteMeals, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // ignore: unused_field
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget._favoriteMeals),
        'title': 'Your Favorites',
      }
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = _pages;
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'].toString()),
      ),
      body: pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
