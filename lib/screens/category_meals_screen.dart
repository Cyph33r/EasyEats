import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);
  static const routeName = './category_meal_screen';

  @override
  Widget build(BuildContext context) {
    final arguments =
        (ModalRoute.of(context)?.settings.arguments as Map<String, Object>);
    final categoryId = arguments['id'] as int;
    final categoryTitle = arguments['name'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(categoryTitle),
      ),
    );
  }
}
