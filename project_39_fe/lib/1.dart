//<a href="https://www.flaticon.com/free-icons/pet-care" title="pet care icons">Pet care icons created by photo3idea_studio - Flaticon</a>
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './menum.dart';
class buttom extends StatelessWidget {
  const buttom({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
          child:Container(
            padding:EdgeInsets.all(20),
            decoration:BoxDecoration(color:Color.fromARGB(255, 202, 140, 163),borderRadius: BorderRadius.circular(40)),
            child:Row(
              children:[
            const Text("Get started!",style:TextStyle(color:Colors.white)),
            const SizedBox(width:10),
            Icon(Icons.arrow_forward,color:Colors.white)]
      ),)
    );
  }
}
class  IntroPage extends StatelessWidget {
  const  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 55, 87),
      body:Padding(padding: EdgeInsets.all(15.0) ,
      child: ListView(
        children:[
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          SizedBox(height:25),
          
          Text("PET ADOPTION",style: GoogleFonts.dmSerifDisplay(fontSize: 28,color:Colors.white),),
          SizedBox(height:15),
          Padding(padding: EdgeInsets.all(20.0),child:Image.asset("images/favicon.png"),),
          SizedBox(height:15),
          Text("Pets are always our best friends!",style: GoogleFonts.dmSerifDisplay(fontSize: 33,color:Colors.white),),
          SizedBox(height:10),
          Text("Sadly, we have hundreds of animals available for adoption. They come to us as strays, found by our inspectors or rescued by members of the public but the vast majority of our lovable pets are surrendered by owners unable or unwilling to care for them any longer.Research over the last decade has shown that pets can have a significant impact on human mental and physical health, bringing joy to everyone in a household. Adopting a pet also brings incredible joy to the animal. It’s also worth remembering that one adoption saves two lives; every time a lucky animal leaves our adoption centre, their place is vacated for another animal to take their turn.So if you have room in your heart for an animal, please have a look at the pets currently looking for their forever homes."
          ,style: TextStyle(
            color:Colors.grey[200],
            height:2,
          ),)
          ,
          SizedBox(height:15),
          buttom(onTap: () {
            Navigator.pushNamed(context, '/menupage');
          },)

          
        ])]
      )));
  }
  }

