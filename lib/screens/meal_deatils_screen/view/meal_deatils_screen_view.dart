import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/data/models/meal.dart';
import 'package:e_commerce_app/main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;

  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton.filledTonal(
            icon: const Icon(CupertinoIcons.star),
            onPressed: () => onToggleFavorite(meal),
          )
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 15),
            Text(
              'Ingredients',
              style: style18.copyWith(color: myColorScheme.primary),
            ),
            const SizedBox(height: 5),
            for (var ingredient in meal.ingredients)
              Text(
                ingredient,
                style: style15,
              ),
            const SizedBox(height: 10),
            Text(
              'Steps',
              style: style18.copyWith(color: myColorScheme.primary),
            ),
            const SizedBox(height: 5),
            for (var steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: style15,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
