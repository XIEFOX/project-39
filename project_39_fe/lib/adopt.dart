import 'package:flutter/material.dart';
import 'package:project_39_fe/src/constant.dart';

class AdoptPage extends StatefulWidget {
  @override
  State<AdoptPage> createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 20.0),
        child: ListView(
          children: buildCards(),
        ));
  }

  Widget buildCard((String, String, String) xs) {
    return FilledCardExample(
      enabled: false,
      name: xs.$2,
      url: xs.$1,
      decs: xs.$2,
      useravarurl: xs.$1,
    );
  }

  List<Widget> buildCards() {
    final List<(String, String, String)> xs = [
      ("$object_storage_url/objs/0/profile.png", "叫什么好呢", "有什么性格呢、爱吃什么呢"),
      ("$object_storage_url/objs/0/profile.png", "叫什么好呢", "有什么性格呢、爱吃什么呢"),
    ];

    return xs.map(buildCard).toList();
  }
}

class FilledCardExample extends StatelessWidget {
  final bool enabled;
  final String name;
  final String url;
  final String decs;
  final String useravarurl;

  const FilledCardExample(
      {super.key,
      required this.enabled,
      required this.name,
      required this.url,
      required this.decs,
      required this.useravarurl});

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed =
        enabled ? () {} : null; //这边有一个收养的onpressed事件
    return SingleChildScrollView(
        child: Flexible(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: SizedBox(
          width: 500,
          height: 400,
          child: Center(
              child: Column(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(3),
                    child: Positioned.fill(
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80),
                                bottomRight: Radius.circular(80),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                            ))),
                  )),
              Expanded(
                flex: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(useravarurl),
                  ),
                  title: Text(name),
                  subtitle: Text(
                    decs,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    IconButton.filled(
                        onPressed: onPressed,
                        icon: const Icon(Icons.favorite_rounded)),
                    SizedBox(
                      width: 330,
                    ),
                    ActionChipExample()
                  ]))
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
    return ActionChip(
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
