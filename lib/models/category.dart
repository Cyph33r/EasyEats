import 'package:flutter/material.dart';

class Category {
  final id = currentId++;
  final String title;
  final Color color;
  static var currentId = 0;

  Category(this.title, [this.color = Colors.orange]);
}
