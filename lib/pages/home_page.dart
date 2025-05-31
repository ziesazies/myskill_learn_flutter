import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, c) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(16),
              ),
              child:
                  c.maxWidth > 1000
                      ? Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Picture()),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PictureAttribute(),
                                const SizedBox(height: 16),
                                Title(),
                                const SizedBox(height: 16),
                                Description(),
                              ],
                            ),
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          Picture(),
                          const SizedBox(height: 16),
                          PictureAttribute(),
                          const SizedBox(height: 16),
                          Title(),
                          const SizedBox(height: 16),
                          Description(),
                          const SizedBox(height: 16),
                        ],
                      ),
            ),
          );
        },
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Flutter Raise Call Demo",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PictureAttribute extends StatelessWidget {
  const PictureAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(EvaIcons.heart, color: Colors.red),
        Text(' 1200'),
        const SizedBox(width: 8),
        Icon(EvaIcons.messageCircleOutline),
        Text(' 300'),
        const SizedBox(width: 8),
        Icon(EvaIcons.share),
        Text(' 150'),
        Spacer(),
        Icon(EvaIcons.bookmarkOutline),
      ],
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image(
        image: Image.network('https://picsum.photos/800/400').image,
        fit: BoxFit.cover,
      ),
    );
  }
}
