import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

class MediaIntegrationPage extends StatefulWidget {
  const MediaIntegrationPage({super.key});

  @override
  State<MediaIntegrationPage> createState() => _MediaIntegrationPageState();
}

class _MediaIntegrationPageState extends State<MediaIntegrationPage> {
  File? imageFile;
  File? videoFile;
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    checkCameraStorage();
    super.initState();
  }

  void pickMedia(bool isCamera, bool isVideo) async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile =
        isVideo
            ? await imagePicker.pickVideo(source: isCamera ? ImageSource.camera : ImageSource.gallery)
            : await imagePicker.pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);

    if (pickedFile != null) {
      if (isVideo) {
        videoFile = File(pickedFile.path);
        videoPlayerController?.dispose(); // Dispose controller lama

        videoPlayerController = VideoPlayerController.file(videoFile!);
        await videoPlayerController!.initialize(); // Tunggu hingga siap

        setState(() {
          imageFile = null; // Hapus image jika sedang buka video
        });

        videoPlayerController!.play(); // Optional
      } else {
        setState(() {
          imageFile = File(pickedFile.path);
          videoFile = null; // Hapus video jika sedang buka image
          videoPlayerController?.dispose(); // Dispose video controller
          videoPlayerController = null;
        });
      }
    } else {
      print('User canceled picking');
    }
    ;
  }

  void checkCameraStorage() async {
    final checkCamera = await Permission.camera.status;
    final checkStorage = await Permission.storage.status;

    if (checkCamera.isGranted) {
      print('Camera has been granted');
    } else {
      final requestCamera = await Permission.camera.request();
      if (requestCamera.isGranted) {
        print('Camera has been granted');
      }
      print('Camera has been invoked');
    }

    if (checkStorage.isGranted) {
      print('Storage has been granted');
    } else {
      final requestStorage = await Permission.camera.request();
      if (requestStorage.isGranted) {
        print('Storage has been granted');
      }
      print('Storage has been invoked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Media App')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (imageFile != null)
              InkWell(
                onTap: () {
                  pickMedia(false, false);
                },
                child: Image.file(imageFile!),
              )
            else
              CardMedia(
                iconData: Icons.image_outlined,
                isVideo: false,
                onPressed: () => pickMedia(false, false),
                onPressedCamera: () => pickMedia(true, false),
              ),
            if (videoPlayerController != null && videoPlayerController!.value.isInitialized)
              InkWell(
                onTap: () => pickMedia(false, true),
                child: AspectRatio(
                  aspectRatio: videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(videoPlayerController!),
                ),
              )
            else
              CardMedia(
                iconData: Icons.video_call,
                isVideo: true,
                onPressed: () => pickMedia(false, true),
                onPressedCamera: () => pickMedia(true, true),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }
}

class CardMedia extends StatelessWidget {
  const CardMedia({super.key, required this.iconData, required this.isVideo, this.onPressed, this.onPressedCamera});

  final IconData iconData;
  final bool isVideo;
  final Function()? onPressed;
  final Function()? onPressedCamera;

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
          FilledButton.icon(icon: Icon(Icons.folder), onPressed: onPressed, label: Text('Gallery')),
          FilledButton.icon(icon: Icon(Icons.camera), onPressed: onPressedCamera, label: Text('Camera')),
        ],
      ),
    );
  }
}
