import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/screens/meal_screen/view/meal_screen_view.dart';
import 'package:flutter/material.dart';

import '../../../data/models/category.dart';
import '../../../data/models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.onToggleFavorite,
      required this.availableMeals});

  final Category category;
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: myColorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        final filteredMeal = availableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealScreenView(
              title: category.title,
              meal: filteredMeal,
              onToggleFavorite: onToggleFavorite,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.40),
            category.color.withOpacity(0.80),
            category.color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: myColorScheme.onPrimaryContainer,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
