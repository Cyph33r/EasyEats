import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../data/dummy_data.dart' show DUMMY_MEALS;

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);
  static const routeName = './category_meal_screen';

  @override
  Widget build(BuildContext context) {
    final arguments =
        (ModalRoute.of(context)?.settings.arguments as Map<String, Object>);
    final categoryId = arguments['id'] as int;
    final categoryTitle = arguments['name'] as String;
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (_, index) => MealItem(categoryMeals[index])),
    );
  }
}
