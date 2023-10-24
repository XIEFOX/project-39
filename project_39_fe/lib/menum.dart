import 'package:flutter/material.dart';
import 'package:project_39_fe/src/login.dart';
import './main.dart';
import './card.dart';
class InputChipExample extends StatefulWidget {
  const InputChipExample({super.key});

  @override
  State<InputChipExample> createState() => _InputChipExampleState();
}

class _InputChipExampleState extends State<InputChipExample> {
  int inputs = 3;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputChip Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 5.0,
              children: List<Widget>.generate(
                inputs,
                (int index) {
                  return InputChip(
                    label: Text('Person ${index + 1}'),
                    selected: selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = null;
                        } else {
                          selectedIndex = index;
                        }
                      });
                    },
                    onDeleted: () {
                      setState(() {
                        inputs = inputs - 1;
                      });
                    },
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  inputs = 3;
                });
              },
              child: const Text('Reset'),
            )
          ],
        ),
      ),
    );
  }
}

class StatefulDrawer extends StatefulWidget {
  const StatefulDrawer({super.key});

  @override
  State<StatefulDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<StatefulDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("images/4.jpeg"), fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('登陆'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginDemo();
                },
              ));
            },
          ),
          ListTile(
            title: Text('退出'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }}
  class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(currentPage),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (tapped) {
          setState(() {
            currentPage = tapped;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: '领养',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: '上传信息',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '主页',
          ),
        ],
      ),
    );
  }


 Widget buildBody(int currentPage) {
   
    if (currentPage == 0) {
      return Container(
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
                          EdgeInsets.symmetric(horizontal: 8.0)),
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
                ),
               // const InputChipExample(),
                Expanded(
                  flex: 2,
                  child: GridView.count(
                   // gridDelegate:
                       // const SliverGridDelegateWithFixedCrossAxisCount(
                        //    crossAxisCount: 2),
                      padding: const EdgeInsets.all(8.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 250,
                      children: const [
                        //FilledCardExample(enabled: false, name: "狗", url: "images/5.jpg", decs: "这是一只狗", useravarurl:"iamges/6.jpg"),
                      //FilledCardExample(enabled: false, name: "狗", url: "images/5.jpg", decs: "这是一只狗", useravarurl:"iamges/6.jpg"),
                      //FilledCardExample(enabled: false, name: "狗", url: "images/5.jpg", decs: "这是一只狗", useravarurl:"iamges/6.jpg"),
                      ]
                        
                    
                    
                  ),
                )
              ])));
    }else  if(currentPage==2)
    {
      return Scaffold(
        body: ListView(
          children: [],
        ),

      );
      
      
    }else if(currentPage==3)
    {
      return  ListView(
        children: const <Widget>[
          ListTile(
            leading: CircleAvatar(child: Text('A')),
            title: Text('Headline'),
            subtitle: Text('Supporting text'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('B')),
            title: Text('Headline'),
            subtitle: Text(
                'Longer supporting text to demonstrate how the text wraps and how the leading and trailing widgets are centered vertically with the text.'),
            trailing: Icon(Icons.favorite_rounded),
          ),
          Divider(height: 0),
          ListTile(
            leading: CircleAvatar(child: Text('C')),
            title: Text('Headline'),
            subtitle: Text(
                "Longer supporting text to demonstrate how the text wraps and how setting 'ListTile.isThreeLine = true' aligns leading and trailing widgets to the top vertically with the text."),
            trailing: Icon(Icons.favorite_rounded),
            isThreeLine: true,
          ),
          Divider(height: 0),
        ],
      )
    ;
    }
  return Center(
      child: Text("$currentPage"),
    );

     
    }

  
  }

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
              AppBar(title: const Text('宠吾'), foregroundColor: Colors.purple),
      drawer: const StatefulDrawer(),
      body:HomePage()

    );
  }
}