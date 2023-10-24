import 'package:flutter/material.dart';
//import 'package:project_39_fe/src/generated/project_39/v1/project_39.pbgrpc.dart';
import 'package:project_39_fe/src/login.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'dart:async';
import './1.dart';
import './menum.dart';
import './user.dart';
import './card.dart';
//import 'package:grpc/grpc_web.dart';




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

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
          
          body: FilledCardExample(enabled: false, useravarurl: 'iamges/1.jpeg', name: 'Ke', url: 'images/2.jpeg', decs: '这是一个人',)),//HomePage()
          routes: {"/1":(context) => const IntroPage(),
                   "/menupage":(context) => const MenuPage()},
    ),
  );
}



// Widget buildApp() {
//   return Scaffold(
//       appBar: AppBar(title: const Text('宠吾'), foregroundColor: Colors.purple),
//       drawer: const StatefulDrawer(),
//       body: HomePage());
// }




  //     Future<void> selectImageFromGallery() async {
  // final ImagePicker _picker ;
  // try{_picker=ImagePicker();
  // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  // if (image != null) {
  //   // 使用选择的图片
  //   print('选择的图片路径：${image.path}');
  // } else {
  //   print('没有选择图片。');
  // }
  // }catch(e){}
  // // 从图库选择图片
  //  return Scaffold(
  //       body: SingleChildScrollView(
  //              child: Column(
  //               children:<Widget>[
  //               Row(
  //                 children:[
                  
  //                 SizedBox.square(
  //                 dimension: 30,
  //                 child:Stack(children:[Image.asset("images/4.jpeg"),const Icon(Icons.add_a_photo)])
  //               )  ,

  //               //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                
  //            const Padding( padding: EdgeInsets.symmetric(horizontal: 15),
  //             child: TextField(
  //               decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: '用户名',
  //                   hintText: "柯言"),
  //             )),
  //             const Padding( padding: EdgeInsets.symmetric(horizontal: 15),
  //             child: TextField(
  //               decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: '邮箱',
  //                   hintText: '1399606013@QQ.com'),
  //             ))]),
  //             const Padding( 
  //               padding: EdgeInsets.symmetric(horizontal: 15),
  //             child: TextField(
  //               decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: '手机号',
  //                   hintText: '18905917866')),
  //             ),
  //             const Padding( padding: EdgeInsets.symmetric(horizontal: 15),
  //             child: TextField(
  //               decoration: InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: '地址',
  //                   hintText: 'xxxxxxx'),
  //             )),
  //             //button保存个人信息
  //             TextButton(
  //             onPressed: () {
  //               //上传数据
  //             },
  //             child: const Text(
  //               '保存修改',
  //               style:  TextStyle(color: Colors.blue, fontSize: 15),
  //             ),
  //           ),
  //               ]
  //              ),
             
  //           ),

  //     );

  


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
