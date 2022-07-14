import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';


import '../data/dummy_data.dart' show DUMMY_MEALS;

class FilterMealScreen extends StatefulWidget {
  final void Function(Map<String, bool>) saveFilters;

  late final Map<String, bool> filters;

  FilterMealScreen(this.filters, this.saveFilters, {Key? key})
      : super(key: key);
  static const routeName = './filter_meal_screen';

  @override
  State<FilterMealScreen> createState() => _FilterMealScreenState();
}

class _FilterMealScreenState extends State<FilterMealScreen> {
  final displayedMeals = DUMMY_MEALS;
  late Map<String, bool> filters;

  @override
  void initState() {
    super.initState();
    filters = {
      'isVegan': widget.filters['isVegan']!,
      'isVegetarian': widget.filters['isVegetarian']!,
      'isLactoseFree': widget.filters['isLactoseFree']!,
      'isGlutenFree': widget.filters['isGlutenFree']!
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Meals'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save Filters',
            onPressed: () {
              widget.saveFilters(filters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                const Text('Filter Your Meal'),
                _buildSwitchListTile(
                    'Vegan', 'Only include Vegan meals', filters['isVegan']!,
                    (bool value) {
                  setState(() => filters['isVegan'] = value);
                }),
                _buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    filters['isVegetarian']!, (bool value) {
                  setState(() => filters['isVegetarian'] = value);
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include Lactose-free meals',
                    filters['isLactoseFree']!, (bool value) {
                  setState(() => filters['isLactoseFree'] = value);
                }),
                _buildSwitchListTile(
                    'Gluten-free',
                    'Only include Gluten-free meals',
                    filters['isGlutenFree']!, (bool value) {
                  setState(() => filters['isGlutenFree'] = value);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile _buildSwitchListTile(String title, String description,
      bool value, void Function(bool) onChanged) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        visualDensity: const VisualDensity(vertical: -4),
        activeColor: Theme.of(context).colorScheme.secondary,
        activeTrackColor: Theme.of(context).colorScheme.secondary,
        value: value,
        onChanged: onChanged);
  }
}
