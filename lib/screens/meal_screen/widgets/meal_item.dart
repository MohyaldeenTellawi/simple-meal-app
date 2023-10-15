import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/data/models/meal.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectedMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectedMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsetsDirectional.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: Column(
        children: [
          InkWell(
            onTap: () => onSelectedMeal(meal),
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 6, horizontal: 30),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: myColorScheme.onPrimaryContainer,
                                  fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.schedule_outlined),
                  const SizedBox(width: 6),
                  Text(
                    '${meal.duration} min',
                    style: style13,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.schedule_outlined),
                  const SizedBox(width: 6),
                  Text(
                    complexityText[meal.complexity],
                    style: style13,
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.attach_money_outlined),
                  const SizedBox(width: 6),
                  Text(
                    affordabilityText[meal.affordability],
                    style: style13,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
