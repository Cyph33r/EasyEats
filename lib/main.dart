import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/' :(context)=>const TabScreen(),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: const CategoriesScreen(),
    );
  }
}
