import 'package:flutter/material.dart';
import 'package:project_39_fe/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    home: const LoginPage(),
  ));
}
