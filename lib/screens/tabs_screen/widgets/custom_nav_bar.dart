import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customBottomNaviagtionBarItem(String lable, Widget icon, Widget activeIcon) {
  return BottomNavigationBarItem(
      icon: icon, label: lable, activeIcon: activeIcon);
}

List<BottomNavigationBarItem> buttonTabs = [
  customBottomNaviagtionBarItem('Categories', const Icon(Icons.set_meal),
      const Icon(Icons.set_meal_sharp)),
  customBottomNaviagtionBarItem('Favorite', const Icon(CupertinoIcons.star),
      const Icon(CupertinoIcons.star_fill)),
];
