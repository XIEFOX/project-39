import 'package:flutter/material.dart';
import 'package:project_39_fe/src/generated/project_39/v1/project_39.pbgrpc.dart';
import 'package:project_39_fe/src/login.dart';
//import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'dart:async';
import 'package:grpc/grpc_web.dart';

Project39ServiceClient newClient () {
  final GrpcWebClientChannel channel = GrpcWebClientChannel.xhr(Uri.parse("127.0.0.1:9945"));
  return Project39ServiceClient(channel);
}

void callInterface () async {
  final client = newClient();
  final result = await client.displayObjectsInfoBatch(DisplayObjectsInfoBatchRequest(batchSize: 100));
  final List<DisplayObjectsInfo> infos = result.displayObjectsInfo;
  infos[0].name;
  infos[0].url;
  infos[0].desc;

  final List<Widget> cards = infos.map((e) {
    return Card(
      
    );
  }).toList();

  final result1 = await client.getUserInfo(GetUserInfoRequest(userName: "ksy") );
  result1.userAddr;
  result1.userAvatarUrl;
  result1.userMail;
}

class FilledCardExample extends StatelessWidget {
   final bool enabled;
   final  String  name;
   final  String  url;
   final  String  decs;
   final  String useravarurl;

   const FilledCardExample({super.key, required this.enabled, required this.name, required this.url, required this.decs, required this.useravarurl});

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: SizedBox(
          width: 500,
          height: 400,
          child: Center(
              child: Column(
            children: <Widget>[
              Container(
                child: Positioned.fill(
                  child:Image.asset("$url",
                  fit: BoxFit.contain,)
                  
                ),
                margin: EdgeInsets.all(3),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("$useravarurl"),
                ),
                title: Text("$name"),
                subtitle: Text(
                  "$decs",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),IconButton.filled(
              onPressed: onPressed, icon: const Icon(Icons.favorite_rounded)),
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

class HomePageWithSplashScreen extends StatefulWidget {
  @override
  State<HomePageWithSplashScreen> createState() =>
      _HomePageWithSplashScreenState();
}

class _HomePageWithSplashScreenState extends State<HomePageWithSplashScreen> {
  bool _init = false;

  @override
  Widget build(BuildContext context) {
    if (!_init) {
      setState(() {
        _init = false;
      });
      return Splash();
    } else {
      return buildApp();
    }
  }
}

Widget buildApp() {
  return Scaffold(
      appBar: AppBar(title: const Text('宠吾'), foregroundColor: Colors.purple),
      drawer: const StatefulDrawer(),
      body: HomePage());
}

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() async {
    super.initState();
    // await Future.delayed(const Duration(seconds: 3));
    // // ignore: use_build_context_synchronously
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return buildApp();
    // }));

    startTime();
  }

  startTime() async {
    return Timer(const Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => buildApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("欢迎来到我的应用！"),
      ),
    );
  }
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
    List<Widget> _initGridview()
    {  
             return infos.map((e) {
              return FilledCardExample(enabled: false, name: infos[e].name, url: infos[e].url, decs: infos[e].decs, useravarurl: "$(result1.userAvatarUrl)");
  }).toList();
    }
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
                  child: GridView.count(
                   // gridDelegate:
                       // const SliverGridDelegateWithFixedCrossAxisCount(
                        //    crossAxisCount: 2),
                      padding: const EdgeInsets.all(8.0),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 250,
                      children: _initGridview()
                        
                    
                    
                  ),
                )
              ])));
    }else  if(currentPage==2)
    {
      return Container(
        child: ListView(
               children: [ //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
             Padding( padding: EdgeInsets.symmetric(horizontal: 15),
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '用户名',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              )),
              Padding( padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '邮箱',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              )),
              Padding( padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '手机号',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              )),Padding( padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '地址',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              )),
              //button保存个人信息
              ],
             
            ),

      );
    }else if(currentPage==3)
    {
      return Container();
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
