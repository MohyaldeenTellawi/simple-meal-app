import 'package:e_commerce_app/data/models/meal.dart';
import 'package:e_commerce_app/screens/meal_deatils_screen/view/meal_deatils_screen_view.dart';
import 'package:e_commerce_app/screens/meal_screen/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class MealScreenView extends StatelessWidget {
  const MealScreenView(
      {super.key,
      this.title,
      required this.meal,
      required this.onToggleFavorite,
      this.noDataIcon});
  final String? title;
  final List<Meal> meal;
  final List<Meal>? noDataIcon;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meal
            .map((meal) => MealItem(
                  meal: meal,
                  onSelectedMeal: (Meal meal) {
                    Navigator.of(context).push(
                      SwipeablePageRoute(
                        transitionDuration: const Duration(milliseconds: 1000),
                        canOnlySwipeFromEdge: true,
                        fullscreenDialog: true,
                        builder: (context) => MealDetailsScreen(
                          meal: meal,
                          onToggleFavorite: onToggleFavorite,
                        ),
                      ),
                    );
                  },
                ))
            .toList(),
      ),
    );
  }
}
