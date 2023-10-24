import 'package:flutter/material.dart';
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
                  child:Image.asset(url,
                  fit: BoxFit.contain,)
                  
                ),
                margin: EdgeInsets.all(3),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(useravarurl),
                ),
                title: Text(name),
                subtitle: Text(
                  decs,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),Row(children:[IconButton.filled(
              onPressed: onPressed, icon: const Icon(Icons.favorite_rounded)),const ActionChipExample()])
            ],
          )),
        ),
      ),
    );
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
