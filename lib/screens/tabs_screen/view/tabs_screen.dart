import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/data/dummy_data/dummy_data.dart';
import 'package:e_commerce_app/data/models/meal.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/screens/filters_screen/view/filters_screen_view.dart';
import 'package:e_commerce_app/screens/home_screen/view/home_screen_view.dart';
import 'package:e_commerce_app/screens/meal_screen/view/meal_screen_view.dart';
import 'package:e_commerce_app/screens/tabs_screen/widgets/custom_drawer.dart';

import 'package:e_commerce_app/screens/tabs_screen/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';

const kInitialValue = {
  Filters.glutenFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
  Filters.lactoseFree: false,
};

class TabsScreenView extends StatefulWidget {
  const TabsScreenView({super.key});

  @override
  State<TabsScreenView> createState() => _TabsScreenViewState();
}

class _TabsScreenViewState extends State<TabsScreenView> {
  int _selectedPageIndex = 0;
  bool favoriteIsEmbty = false;
  _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.endToStart,
        duration: const Duration(seconds: 2),
        content: Text(
          message,
          style: style18.copyWith(color: myColorScheme.primaryContainer),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  List<Meal> _favoriteMeal = [];

  void _toggelMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showInfoMessage('removed from favorite');
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  void _selectePage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Map<Filters, bool> _selectedFilters = kInitialValue;

  void _setScreen(String identifire) {
    Navigator.of(context).pop();
    if (identifire == 'filters') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilterScreenView(
            currentFilter: _selectedFilters,
          ),
        ),
      ).then(
        (value) {
          setState(() {
            _selectedFilters = value ?? kInitialValue;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = HomeScreenView(
      availableMeals: availableMeals,
      onToggleFavorite: _toggelMealFavoriteStatus,
    );
    String activePageTitle = 'Select Category';
    if (_selectedPageIndex == 1) {
      activePage = MealScreenView(
          meal: favoriteIsEmbty ? [] : _favoriteMeal,
          onToggleFavorite: _toggelMealFavoriteStatus);
      activePageTitle = 'Favorite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: myColorScheme.primaryContainer,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        items: buttonTabs,
        currentIndex: _selectedPageIndex,
        onTap: _selectePage,
      ),
    );
  }
}
