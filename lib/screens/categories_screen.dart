import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../data/dummy_data.dart' show DUMMY_CATEGORIES;

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories_screen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, mainAxisSpacing: 16, crossAxisSpacing: 16,childAspectRatio: 3/2),
        children: DUMMY_CATEGORIES
            .map((category) => CategoryItem(category.id, category.title, category.color))
            .toList(),
      ),
    );
  }
}
