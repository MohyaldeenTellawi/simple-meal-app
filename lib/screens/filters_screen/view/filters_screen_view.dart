import 'package:e_commerce_app/core/utils/styles.dart';

import 'package:flutter/material.dart';

class FilterScreenView extends StatefulWidget {
  const FilterScreenView({super.key, required this.currentFilter});
  final Map<Filters, bool> currentFilter;
  @override
  State<FilterScreenView> createState() => _FilterScreenViewState();
}

enum Filters { glutenFree, vegan, vegetarian, lactoseFree }

class _FilterScreenViewState extends State<FilterScreenView> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.currentFilter[Filters.glutenFree]!;
    _isVegan = widget.currentFilter[Filters.vegan]!;
    _isVegetarian = widget.currentFilter[Filters.vegetarian]!;
    _isLactoseFree = widget.currentFilter[Filters.lactoseFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _isGlutenFree,
            Filters.vegan: _isVegan,
            Filters.vegetarian: _isVegetarian,
            Filters.lactoseFree: _isLactoseFree,
          });
          return false;
        },
        child: Column(
          children: [
            customSwitch(
              context,
              'Gluten Free',
              'Only Include Gluten-Free Meals',
              _isGlutenFree,
              (bool val) {
                setState(() {
                  _isGlutenFree = val;
                });
              },
            ),
            customSwitch(
              context,
              'Vegan',
              'Only Include Vegan Meals',
              _isVegan,
              (bool val) {
                setState(() {
                  _isVegan = val;
                });
              },
            ),
            customSwitch(
              context,
              'Vegetarian',
              'Only Include Vegetarian Meals',
              _isVegetarian,
              (bool val) {
                setState(() {
                  _isVegetarian = val;
                });
              },
            ),
            customSwitch(
              context,
              'Lactose Free',
              'Only Include Lactose-Free Meals',
              _isLactoseFree,
              (bool val) {
                setState(() {
                  _isLactoseFree = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newVal) onChanged,
  ) {
    return SwitchListTile.adaptive(
      contentPadding: const EdgeInsets.only(left: 30, right: 20),
      title: Text(
        title,
        style: style18,
      ),
      subtitle: Text(
        subtitle,
        style: style15,
      ),
      value: filter,
      onChanged: onChanged,
    );
  }
}
