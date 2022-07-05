import 'package:flutter/material.dart';

import '../util/constants.dart' show Screens;
import 'categories_screen.dart';
import 'category_meals_screen.dart';

void main() => runApp(const MyApp());

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
        canvasColor: const Color.fromARGB(225, 254, 229, 255),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(color: Color.fromARGB(225, 22, 22, 29)),
            bodyText2: const TextStyle(color: Color.fromARGB(225, 22, 22, 29)),
            subtitle1: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway')),
        fontFamily: "RobotoCondensed",
      ),
      home: const MyHomePage(),
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen()
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
