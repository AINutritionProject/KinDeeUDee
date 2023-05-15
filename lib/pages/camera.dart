import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/eat_confirm.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

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
            XFile? image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (image == null) {
              print("Not get image");
              return;
            }
            if (!context.mounted) {
              return;
            }
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EatConfirmPage(image: image)));
          },
          child: const Icon(Icons.image),
        ),
        appBar: AppBar(
          title: const Text("Camera Page"),
        ),
        body: FutureBuilder(
          future: _initCamera(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
