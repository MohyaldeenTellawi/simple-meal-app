import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:e_commerce_app/main.dart';

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifire) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .07),
      child: Drawer(
        width: MediaQuery.of(context).size.width * .65,
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  myColorScheme.onPrimaryContainer.withOpacity(0.3),
                  myColorScheme.onPrimaryContainer.withOpacity(0.6),
                  myColorScheme.onPrimaryContainer.withOpacity(0.9),
                ], begin: Alignment.bottomLeft, end: Alignment.topRight),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fastfood_rounded,
                      size: 40,
                      color: myColorScheme.secondaryContainer,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Coocking Up...',
                    style: style18.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Meals',
                style: style18.copyWith(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.restaurant,
                size: 25,
              ),
              onTap: () {
                onSelectScreen('meals');
              },
            ),
            ListTile(
              title: Text(
                'Filters',
                style: style18.copyWith(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.settings,
                size: 25,
              ),
              onTap: () {
                onSelectScreen('filters');
              },
            ),
          ],
        ),
      ),
    );
  }
}
