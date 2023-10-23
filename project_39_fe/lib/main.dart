import 'package:flutter/material.dart';
import 'package:project_39_fe/src/login.dart';

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child:  SizedBox(
          width: 400,
          height: 300,
          child: Center(child: Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "images/1.jpeg",
                  fit: BoxFit.cover,
                ),
                margin: EdgeInsets.all(10),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "images/2.jpg"),
                ),
                title: Text("Candy Shop"),
                subtitle:  Text(
                  "Flutter is Goole's moblie UI framework for crafting higt ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],

          )),
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
                    image: AssetImage("images/3.jpg"), fit: BoxFit.cover)),
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
  }
  //   return  Container(

  //     child:const Column(
  //       mainAxisAlignment: ,

  //       children:  [SizedBox(height:60, width: 30),Expanded(flex:1,child:DrawerHeader(decoration:BoxDecoration(//color:Colors.purple,
  //       image: DecorationImage(image:AssetImage("images/3.jpg"),//???
  //       fit: BoxFit.cover),
  //       ),child:Text("")),

  //       )
  //       ]

  //   ));
  // }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar:
              AppBar(title: const Text('宠吾'), foregroundColor: Colors.purple),
          drawer: const StatefulDrawer(),
          body: HomePage()),
    ),
  );
}

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
                Expanded(
                  flex: 2,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    children: [
                      FilledCardExample(),
                      FilledCardExample(),
                      FilledCardExample()
                    ],
                  ),
                )
              ])));
    }

    return Center(
      child: Text("$currentPage"),
    );
  }
}

// 这里这么几行就是最简单的一个 material design 程序的例子，然后 home 本身需要是一个组件
// 然后我们假设我们不知道主页应该放什么，就去网上找例子
// 我们目前目标是写一个有刚刚你说的那种侧面导航栏的程序，然后有至少三个页面
// 第一个页面有文本输入框和按钮，第二个页面有列表展示信息，第三个页面还没想
// 登陆界面可以单独写，写好之后用导航器 push 来看
// 你先把你想写的几个列出来？还有流程关系可以简单写一下
//第一个启动界面 几秒钟之后跳转到登陆界面 之后进主页面 主页面 ：头部导航搜索 最下面的导航 领养与找领养之类的 右侧拉动就是登陆 后台数据怎么处理我不知道你看看要不要一个管理员模式，我主要不知道怎么绑后台数据
// 这种启动界面到登陆界面到主页的不难写，因为渲染逻辑是独立的，就导航器 push 一下就可以了，所以先写主页吧
//  可以登陆界面和主页分别写好了来加上，挺简单的
// 先写主页把

// 如果只创建一个 Scaffold 的画就是填充整个窗口，别的什么也不会做，然后现在先来把 app bar 加上，再把内容加上，标题栏也可以加上

// 创建好 Scaffold 之后，设置 BottomNavigationBar 就是设置这个界面的底部导航栏，然后 body 就是除了导航栏之外显示的其他内容
// BottomNavigationBar 至少要有三个元素

// BottomNavigationBarItem 只负责画图标，但是没有具体的跳转逻辑
// 因为知道 items 一定是一个列表，所以说可以找一个地方来设置点击之后的效果

// 这个跳转的逻辑是这个样的
// 首先，我们知道 Scaffold 的 body 是一个 widgets,那么它可能是 stateful 的或者 stateless 的
// 然后，我们知道 BottomNavigationBar 提供了一个参数，这个参数接受一个函数，这个函数就是当 BottomNavigationBar 的图标被点击到的时候具体会干什么事情
// 接着，如果 Scaffold 的 body 的这个 widget 是一个 stateful widget，那么 BottomNavigationBar 注册的变化函数就可以调用 setState 去修改 body 的这个 widget
// 然后 body 的这个 widget 有 onStateChange
