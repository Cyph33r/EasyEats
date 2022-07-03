import 'package:flutter/material.dart';

import 'MealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final Color color;

  const CategoryItem(this.name, this.color, {Key? key}) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(name),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => selectMeal(context),
          splashColor: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [color.withOpacity(.7), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }
}
