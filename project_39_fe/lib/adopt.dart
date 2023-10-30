import 'package:flutter/material.dart';

const height = 298.0;

class AdoptPage extends StatefulWidget {
  const AdoptPage({super.key});

  @override
  State<AdoptPage> createState() => _AdoptPageState();
}

class _AdoptPageState extends State<AdoptPage> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        children: const [],
      ),
    );
  }
}

class AdoptData {
  AdoptData(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.category,
      required this.location});

  final String title;
  final String imageUrl;
  final String description;
  final String category;
  final String location;
}

Widget buildCardLayout(BuildContext context, String title, String imageUrl,
    String description, String category, String location) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    child: SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
                height: height,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {},
                    splashColor: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.12),
                    highlightColor: Colors.transparent,
                    child: Semantics(
                      label: title,
                      child: buildCard(context, title, imageUrl, description,
                          category, location),
                    ),
                  ),
                ))
          ],
        ),
      ),
    ),
  );
}

Widget buildCard(BuildContext context, String title, String imageUrl,
    String description, String category, String location) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
          height: 184,
          child: Stack(children: [
            Positioned.fill(
              child: Ink.image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                child: Container(),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Semantics(
                container: true,
                header: true,
                child: Text(
                  title,
                ),
              ),
            ),
          ])),
      // Description and share/explore buttons.
      Semantics(
        container: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black54),
                  ),
                ),
                Text(category),
                Text(location),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
