import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/meals.dart';

class TabsScreen extends StatefulWidget{
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen>{
  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage  = const CategoriesScreen();
    String activePageTitle = 'Categories';

    if(_selectedPageIndex == 1){
      activePage = const MealScreen(meals: []);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){_selectPage(index);},
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories',),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorite',),
        ],
      ),
    );
  }
}
