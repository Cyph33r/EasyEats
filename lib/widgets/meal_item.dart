import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

import '../models/meal.dart';
import '../util/utils.dart' show StringUtil;

class MealItem extends StatelessWidget {
  final Meal meal;
  final void Function(int) removeMeal;

  const MealItem(this.meal, this.removeMeal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.pushNamed(context, MealDetailScreen.routeName,
          arguments: {'mealId': meal.id}).then((result) =>removeMeal(result! as int));
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // shape: const CircleBorder(side: BorderSide.none),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.asset(
                      'assets/images/replacement.png',
                      // loadingBuilder: ,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 8,
                  child: Container(
                    height: 38,
                    width: 300,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(
                        left: 4, top: 0, right: 0, bottom: 0),
                    color: Colors.white60,
                    child: Hero(
                      tag: '${meal.id}title',
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          meal.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontFamily: 'Raleway',
                            overflow: TextOverflow.fade,
                          ),
                          softWrap: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
