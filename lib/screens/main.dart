import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_meal_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import '../models/meal.dart';

import 'categories_screen.dart';
import 'category_meals_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Map<String, bool> filters;
  late final List<Meal> availableMeals = [];

  void saveFilters(Map<String, bool> filters) {
    this.filters['isVegan'] = filters['isVegan']!;
    this.filters['isVegetarian'] = filters['isVegetarian']!;
    this.filters['isGlutenFree'] = filters['isGlutenFree']!;
    this.filters['isLactoseFree'] = filters['isLactoseFree']!;
    availableMeals.addAll(DUMMY_MEALS.where((meal) =>
        (meal.isLactoseFree || !filters['isLactoseFree']!) &&
        (meal.isGlutenFree || !filters['isGlutenFree']!) &&
        (meal.isVegan || !filters['isVegan']!) &&
        (meal.isVegetarian || !filters['isVegetarian']!)));
  }

  @override
  void initState() {
    filters = {
      'isVegan': false,
      'isVegetarian': false,
      'isLactoseFree': false,
      'isGlutenFree': false,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ThemeData.light().colorScheme.copyWith(
            primary: Colors.pink,
            secondary: Colors.amber,
            background: Colors.blueGrey),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1:
                  const TextStyle(color: Color.fromARGB(225, 22, 22, 29)),
              bodyText2:
                  const TextStyle(color: Color.fromARGB(225, 22, 22, 29)),
              subtitle1: const TextStyle(fontSize: 20.0),
            ),
        fontFamily: "RobotoCondensed",
      ),
      routes: {
        '/': (context) => const TabScreen(),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(filters, availableMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterMealScreen.routeName: (context) =>
            FilterMealScreen(filters, saveFilters),
      },
    );
  }
}
