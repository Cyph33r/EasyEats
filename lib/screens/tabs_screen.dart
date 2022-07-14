import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/route_screen';

  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _currentPage = 0;
  final _pages = [
    {'page': const CategoriesScreen(), 'title': 'DeliMeals'},
    {'title': 'Favorites', 'page': const FavoritesScreen()}
  ];

  void _selectPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_currentPage]['title'].toString()),
        ),
        drawer:  const MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          currentIndex: _currentPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: 'Categories',
                icon: const Icon(Icons.category)),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: 'Favorites',
                icon: const Icon(Icons.favorite))
          ],
        ),
        body: _pages[_currentPage]['page'] as Widget);
  }
}
