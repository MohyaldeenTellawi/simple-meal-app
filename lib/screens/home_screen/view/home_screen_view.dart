import 'package:e_commerce_app/screens/home_screen/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

import '../../../data/dummy_data/dummy_data.dart';
import '../../../data/models/meal.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onToggleFavorite: onToggleFavorite,
            availableMeals: availableMeals,
          )
      ],
    );
  }
}
