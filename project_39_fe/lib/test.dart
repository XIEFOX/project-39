import 'package:flutter/material.dart';
class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: double.infinity,
          height: 800,
        
        ),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(

     // scrollDirection: Axis.horizontal,
      
      crossAxisCount: 3,
      children: [
        OutlinedCardExample(),
         OutlinedCardExample(),

       OutlinedCardExample(),
 OutlinedCardExample(),


      ],

    );
  }

}

