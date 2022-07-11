import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/util/utils.dart';
import '../data/dummy_data.dart' show DUMMY_MEALS;

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal_screen';

  Widget buildSectionHeader(BuildContext context, String header) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        header,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildListContainer(BuildContext context, Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final mealId = arguments['mealId'] as int;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Hero(
                  tag: meal.id,
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: Colors.blue,
                              ),
                              Text('${meal.duration} mins')
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.work,
                                color: Colors.orange,
                              ),
                              Text(meal.complexity.name.toTitleCase())
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.monetization_on_outlined,
                                color: Colors.green,
                              ),
                              Text(meal.affordability.name.toTitleCase())
                            ],
                          )
                        ]),
                    const SizedBox(
                      height: 8,
                    ),
                    Hero(
                        tag: '${meal.id}title',
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            meal.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        )),
                  ]),
                ),
              ],
            ),
            buildSectionHeader(context, 'Ingredients'),
            buildIngredientsList(context, meal),
            buildSectionHeader(context, 'Steps'),
            buildStepsList(context, meal),
          ],
        ),
      ),
    );
  }

  Widget buildStepsList(BuildContext context, Meal meal) {
    return SizedBox(
      height: 250,
      child: buildListContainer(
        context,
        ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: meal.steps.length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  const Divider(height: 10.0,)
                ],
              );
            }),
      ),
    );
  }

  Widget buildIngredientsList(BuildContext context, Meal meal) {
    return SizedBox(
        height: 250,
        child: buildListContainer(
          context,
          ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      meal.ingredients[index],
                      style: const TextStyle(
                          fontSize: 22, fontFamily: 'RobotoCondensed'),
                    ),
                  )),
        ));
  }
}
