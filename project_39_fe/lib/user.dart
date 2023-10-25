
import 'package:flutter/material.dart';
import 'dart:ui';

class DividerExample extends StatelessWidget {
  
  
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
var height = MediaQuery.of(context).size.height;

var padding = MediaQuery.of(context).padding;
var safeHeight = height - padding.top - padding.bottom;
    
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Stack(children: [ 
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
                
              ),
              
            
          ),
         
              Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 94, 94, 94),
                
              ),
              
            child:Center(child: Image.asset("images/5.jpg"))
          ),Positioned(
            bottom: 0,
             left: width/2,
            child:Center(child:CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/5.jpg'),
            ),)
          )
            
            ],),
         
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 243, 227, 255),
              ),
            ),
          ),
          
           Divider(

            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
           Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 243, 227, 255),
              ),
            ),
          ),
          
           Divider(

            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
           Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 243, 227, 255),
              ),
            ),
          ),
          
           Divider(

            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
            color: Colors.grey,
          ),
          ])
       
      );
    
  }
}

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Card(
                child: SizedBox.expand(),
              ),
            ),
            VerticalDivider(),
            Expanded(
              child: Card(
                child: SizedBox.expand(),
              ),
            ),
          ],
        ),
      ),
    );
    
  //   return const Center(
  //     child: Padding(
  //       padding: EdgeInsets.all(16.0),
  //       child: Column(children: [Row(
  //         children: <Widget>[
  //           Expanded(
  //             child: Card(
  //               child: SizedBox.expand(),
  //             ),
  //           ),
  //           VerticalDivider(),
  //           Expanded(
  //             child: Card(
  //               child: SizedBox.expand(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     //   ListView(
  //     //   children:[
  //     //    // Row(

  //     //     //   children: [ Expanded(flex:1, child:CircleAvatar(backgroundImage: AssetImage("images/6.jpg"),radius: 300,),),  VerticalDivider(
  //     //     //   width: 200,
  //     //     //   thickness: 10,
  //     //     //   indent: 20,
  //     //     //   endIndent: 0,
  //     //     //   color: Color.fromARGB(255, 0, 0, 0),
  //     //     // ), 
  //     //     // Expanded(
  //     //     //   flex:2,
  //     //     //   child: Container(
  //     //     //     decoration: BoxDecoration(
  //     //     //       borderRadius: BorderRadius.circular(10),
  //     //     //       color: Color.fromARGB(255, 255, 64, 239),
  //     //     //     ),))],
  //     //    // ),
          
  //     //     ListTile(
  //     //       leading: CircleAvatar(child: Text('A')),
  //     //       title: Text('Headline'),
  //     //       subtitle: Text('Supporting text'),
  //     //       trailing: Icon(Icons.favorite_rounded),
  //     //     ),
  //     //     Divider(height: 0),
  //     //     ListTile(
  //     //       leading: CircleAvatar(child: Text('B')),
  //     //       title: Text('Headline'),
  //     //       subtitle: Text(
  //     //           'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
  //     //       trailing: Icon(Icons.favorite_rounded),
  //     //     ),
  //     //     Divider(height: 0),
  //     //     ListTile(
  //     //       leading: CircleAvatar(child: Text('C')),
  //     //       title: Text('Headline'),
  //     //       subtitle: Text(
  //     //           "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
  //     //       trailing: Icon(Icons.favorite_rounded),
  //     //       isThreeLine: true,
  //     //     ),
  //     //     Divider(height: 0),
  //     //   ]
  //     // )
        
  //       ])  
  //     ),
  //   );
  // }
}}