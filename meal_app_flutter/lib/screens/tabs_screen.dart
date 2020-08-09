import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';
import 'package:meal_app/models/meal.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  //_TabsScreenState(this._pages);

  @override
  void initState() {
    _pages = [
      {
        'page':CategoriesScreen(), 
        'title' : 'Categories'
      },
      {
        'page':FavoritesScreen(widget.favoriteMeals), 
        'title' : 'Your Favourites'
        
      },
    ];
    super.initState();
  }


  void _selectPage (int index) {
    setState(() {
      _selectedPageIndex = index;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        
      ) ,
      drawer: MainDrawer() ,
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ]
      ),

    );
      
    
   

      
    
  }
}