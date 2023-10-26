import 'package:flutter/material.dart';
import 'package:project_39_fe/adopt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavigationBarSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildHomePageBody(_bottomNavigationBarSelectedIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFab(),
    );
  }

  Widget buildBottomNavigationBar() {
    return NavigationBar(
      onDestinationSelected: (selectedIndex) {
        setState(() {
          _bottomNavigationBarSelectedIndex = selectedIndex;
        });
      },
      selectedIndex: _bottomNavigationBarSelectedIndex,
      destinations: const [
        NavigationDestination(
            label: '领养',
            icon: Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.cruelty_free)),
        NavigationDestination(
            label: '发布',
            icon: Icon(Icons.feed_outlined),
            selectedIcon: Icon(Icons.feed)),
        NavigationDestination(
            label: '我的',
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person)),
      ],
    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _bottomNavigationBarSelectedIndex = 1;
        });
      },
      child: const Icon(Icons.edit_outlined),
    );
  }
}

Widget buildHomePageBody(int bottomNavigationBarSelectedIndex) {
  final Widget child;

  switch (bottomNavigationBarSelectedIndex) {
    case 0:
      child = const AdoptPage();
    default:
      throw UnimplementedError();
  }

  return SafeArea(child: child);
}
