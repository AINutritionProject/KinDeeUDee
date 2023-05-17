import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/eat_confirm.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, required this.replaceWhenNavigate});
  final bool replaceWhenNavigate;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController controller;

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    await controller.initialize();
  }

  Future<void> takePicture() async {
    XFile image = await controller.takePicture();
    if (!context.mounted) {
      return;
    }
    if (widget.replaceWhenNavigate) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => EatConfirmPage(image: image)));
      return;
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EatConfirmPage(image: image)));
    }
  }

  Future<void> getImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      print("Not get image");
      return;
    }
    if (!context.mounted) {
      return;
    }
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EatConfirmPage(image: image)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await getImageFromGallery();
          },
          child: const Icon(Icons.image),
        ),
        appBar: AppBar(
          title: const Text("Camera Page"),
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder(
          future: _initCamera(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: CameraPreview(controller),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white70),
                    child: IconButton(
                        onPressed: () async {
                          await takePicture();
                        },
                        icon: const Icon(Icons.camera_alt_rounded,
                            color: Colors.white)),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
