import 'package:flutter/material.dart';
enum Category { cat, dog, rabbit, other }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Category calendarView = Category.cat;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Category>(
      segments: const <ButtonSegment<Category>>[
        ButtonSegment<Category>(
            value: Category.cat,
            label: Text('Cat'),
            icon: Icon(Icons.label_outline)),
        ButtonSegment<Category>(
            value: Category.dog,
            label: Text('Dog'),
            icon: Icon(Icons.label_outline)),
        ButtonSegment<Category>(
            value: Category.rabbit,
            label: Text('Rabbit'),
            icon: Icon(Icons.label_outline)),
        ButtonSegment<Category>(
            value: Category.other,
            label: Text('Other'),
            icon: Icon(Icons.label_outline)),
      ],
      selected: <Category>{calendarView},
      onSelectionChanged: (Set<Category> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

class Adopt extends StatefulWidget {
  const Adopt({super.key});

  @override
  State<Adopt> createState() => _AdoptState();
}

class _AdoptState extends State<Adopt> {
    final TextEditingController iconController = TextEditingController();
     IconLabel? selectedIcon;
  @override
  Widget build(BuildContext context) {
      final List<DropdownMenuEntry<IconLabel>> iconEntries =
        <DropdownMenuEntry<IconLabel>>[];
    for (final IconLabel icon in IconLabel.values) {
      iconEntries
          .add(DropdownMenuEntry<IconLabel>(value: icon, label: icon.label));
    }
    return ListView(//listview 可以用
      children:  <Widget>[
        
        ListTile(
        
          title: Text('上传照片'),
          subtitle: SizedBox(width:600,height:400,child: Image.asset("images/6.jpg"),),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
        Divider(height: 5),
        const ListTile(
          
          title: Text('类别'),
          subtitle:  SingleChoice(),
          // subtitle: DropdownMenu<IconLabel>(
          //           controller: iconController,
          //           enableFilter: true,
          //           leadingIcon: const Icon(Icons.search),
          //           label: const Text('Icon'),
          //           dropdownMenuEntries: iconEntries,
          //           inputDecorationTheme: const InputDecorationTheme(
          //             filled: true,
          //             contentPadding: EdgeInsets.symmetric(vertical: 5.0),
          //           ),
          //           onSelected: (IconLabel? icon) {
          //             setState(() {
          //               selectedIcon = icon;
          //             });
          //           },
          //         ),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
        Divider(height: 5),
        const ListTile(
          
          title: Text('宠物简介'),
          subtitle: TextField(
              maxLines: 20,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Introduction',
                  hintText: 'Enter detailed introduction'),
            ),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
          isThreeLine: true,
        ),
        Container(
           alignment: AlignmentDirectional.bottomCenter,
            height: 50,
            width: 100,
            decoration: BoxDecoration(
                color:Theme.of(context).colorScheme.surfaceVariant,
                 borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '提交信息',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
      ],
    );
    // GridView(

    //   scrollDirection: Axis.horizontal,
      
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
    //   children: [
    //     Image.asset("images/1.jpeg"),
    //     Image.asset("images/2.jpeg"),
    //     Image.asset("images/4.jpeg"),

    //   ],

   
    // );
  }
}