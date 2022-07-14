import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_meal_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDrawerMenuItem(context, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
          }),
          buildDrawerMenuItem(context, 'Filters', Icons.filter_alt, () {
            Navigator.of(context).pushReplacementNamed(FilterMealScreen.routeName);
          })
        ],
      ),
    );
  }

  Widget buildDrawerMenuItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).colorScheme.primary,
      child: ListTile(
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
