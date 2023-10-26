import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const HomePage(),
  ));
}

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
            label: '探索',
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore)),
        NavigationDestination(
            label: '资讯',
            icon: Icon(Icons.feed_outlined),
            selectedIcon: Icon(Icons.feed)),
        NavigationDestination(
            label: '我的',
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person)),
      ],
    );
  }
}

Widget buildHomePageBody(int bottomNavigationBarSelectedIndex) {
  throw UnimplementedError();
}
