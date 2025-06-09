import 'package:flutter/material.dart';

class MediaIntegrationPage extends StatefulWidget {
  const MediaIntegrationPage({super.key});

  @override
  State<MediaIntegrationPage> createState() => _MediaIntegrationPageState();
}

class _MediaIntegrationPageState extends State<MediaIntegrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Media App')),
      body: Column(
        children: [
          CardMedia(iconData: Icons.image_outlined, isVideo: false),
          CardMedia(iconData: Icons.video_call, isVideo: true),
        ],
      ),
    );
  }
}

class CardMedia extends StatelessWidget {
  const CardMedia({super.key, required this.iconData, required this.isVideo});

  final IconData iconData;
  final bool isVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(iconData, size: 60),
          SizedBox(height: 10),
          Text('Input your ${isVideo ? 'Video' : 'Image'}'),
          SizedBox(height: 10),
          FilledButton.icon(
            icon: Icon(Icons.folder),
            onPressed: () {},
            label: Text('Gallery'),
          ),
          FilledButton.icon(
            icon: Icon(Icons.camera),
            onPressed: () {},
            label: Text('Camera'),
          ),
        ],
      ),
    );
  }
}
