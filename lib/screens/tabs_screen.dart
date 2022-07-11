import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/route_screen';

  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var currentState = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentState = index;
          });
        },
        currentIndex: currentState,
        items: const [
          BottomNavigationBarItem(label: 'Categories', icon: Icon(Icons.menu)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );
  }
}
