import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  final String categoryTitle;

  const MealsScreen(this.categoryTitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Container(),
    );
  }
}
