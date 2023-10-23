import 'package:flutter/material.dart';
//import 'package:splashscreen/splashscreen.dart';



class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Center(
        child: Text('你好，世界！'),
      ),
    );
  }
}
