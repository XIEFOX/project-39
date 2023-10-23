import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [buildNavigationRail()],
      )),
    );
  }

  NavigationRail buildNavigationRail() {
    return NavigationRail(
      destinations: const [
        NavigationRailDestination(
            icon: Icon(Icons.change_history), label: Text("Label")),
        NavigationRailDestination(icon: Icon(Icons.stop), label: Text("Label")),
        NavigationRailDestination(
            icon: Icon(Icons.pentagon), label: Text("Label")),
      ],
      selectedIndex: null,
    );
  }
}
