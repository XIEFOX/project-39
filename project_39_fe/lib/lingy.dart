import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FilledCardExample extends StatelessWidget {
   final bool enabled;
   final  String  name;
   final  String  url;
   final  String  decs;
   final  String useravarurl;

   const FilledCardExample({super.key, required this.enabled, required this.name, required this.url, required this.decs, required this.useravarurl});

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;//这边有一个收养的onpressed事件
    return SingleChildScrollView(
      
      child:
    Flexible(
      child: Card(
        shadowColor: Color.fromARGB(255, 87, 87, 87),
        elevation: 20,
        //borderOnForeground: ,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: const Color.fromARGB(255, 73, 43, 78),
            width: 4,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        
        color: Colors.white,//Theme.of(context).colorScheme.surfaceVariant,
        child: SizedBox(
          width:  (MediaQuery.of(context).size.width)*0.4,
                height: (MediaQuery.of(context).size.width)*0.4,
          
          child: Center(
              child: Column(
            children: <Widget>[
              Expanded(flex:6,child:
              Container(
                width:  double.infinity,
                margin: EdgeInsets.all(3),
                     
                child: Positioned.fill(
                  child:Card(
                    margin:EdgeInsets.fromLTRB(0, 0, 0, 0),
                     shape: RoundedRectangleBorder(
          side: BorderSide(
            color: const Color.fromARGB(255, 73, 43, 78),
            width: 4,
            
          ),
           borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(50),bottomRight:Radius.circular(50),topRight: Radius.circular(11),topLeft: Radius.circular(11)),
          ),
                    
                    child:
                  ClipRRect(
                    borderRadius:BorderRadius.
                    only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50),topRight: Radius.circular(11),topLeft: Radius.circular(11)),
                    child: Image.asset(url,
                  fit: BoxFit.cover,
                  
                  )
                  
                ))
                ),
              )),
              Expanded(flex:3,child:
              ListTile(
                // body: CircleAvatar(
                //   backgroundImage:AssetImage(useravarurl),// NetworkImage(useravarurl),
                  
                // ),
                
                title: Text(name,style: GoogleFonts.sedgwickAveDisplay(fontSize: 50,color:const Color.fromARGB(255, 73, 43, 78),),),
                subtitle: Text(
                  "    "+decs,
                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.sedgwickAveDisplay(fontSize: 35,color:Color.fromARGB(255, 83, 77, 83),
                ),
                
              ),),),
              Expanded(flex:1,child:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[IconButton.filled(alignment: Alignment.bottomLeft,
              onPressed: onPressed, icon: const Icon(Icons.favorite_rounded)),Padding(padding: EdgeInsets.fromLTRB(0, 0, 40, 40)), FittedBox(alignment: Alignment.bottomRight,child: ActionChipExample(),),Padding(padding: EdgeInsets.fromLTRB(0, 0, 40, 40))]))
            ],
          )),
        ),
      ),
    ));
  }
}
class ActionChipExample extends StatefulWidget {
  const ActionChipExample({super.key});

  @override
  State<ActionChipExample> createState() => _ActionChipExampleState();
}

class _ActionChipExampleState extends State<ActionChipExample> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return  ActionChip(
          //shape: OutlinedBorder.lerp(a, b, t)
          avatar: Icon(favorite ? Icons.favorite : Icons.favorite_border),
          label: const Text('领养'),
          onPressed: () {
            setState(() {
              favorite = !favorite;
            });
          },
        );
    
  }
}
class BuildPage extends StatefulWidget {
  const BuildPage({super.key});

  @override
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
          height:(MediaQuery.of(context).size.height) ,
    child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 1.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                      trailing: <Widget>[
                        Tooltip(
                          message: 'Change brightness mode',
                          child: IconButton(
                            // isSelected: isDark,
                            onPressed: () {
                              setState(() {
                                // isDark = !isDark;
                              });
                            },
                            icon: const Icon(Icons.wb_sunny_outlined),
                            selectedIcon:
                                const Icon(Icons.brightness_2_outlined),
                          ),
                        )
                      ],
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
                ),//BuildCard(),
                Expanded(flex: 8,child: BuildCard2(),)
                ],
    )
    ));
  }
}

class BuildCard extends StatefulWidget {
  const BuildCard({super.key});

  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
         
      child: Center(
            child:Container(
            alignment: Alignment.center,
            width: (MediaQuery.of(context).size.width)*0.6,
            child: ListView(
                    
                    children: [  FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
                    SizedBox(height: 60,),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
              SizedBox(height: 60,),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
            SizedBox(height: 60,),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),SizedBox(height: 60,),
                    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),SizedBox(height: 60,),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),SizedBox(height: 60,),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),SizedBox(height: 60,),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),SizedBox(height: 60,),],)
          ))

    );
  }
}


class BuildCard2 extends StatelessWidget {
  const BuildCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  GridView(
            padding: EdgeInsets.fromLTRB(180, 20, 180, 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//横轴三个子widget
             // childAspectRatio: 1.0,//子widget宽高比例
              mainAxisSpacing :20,
              crossAxisSpacing:70,
              childAspectRatio:0.7
            ),
          children: const [
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
            FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
    FilledCardExample(decs:'dog is a dog' , enabled: false, name: 'dog', url: 'images/5.jpg', useravarurl: 'images/5.jpg',),
          ],
        ),
    );
  }
}