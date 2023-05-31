import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/eat_confirm.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage(
      {super.key,
      required this.replaceWhenNavigate,
      this.quantiy,
      this.foodName,
      this.unit});
  final bool replaceWhenNavigate;
  final int? quantiy;
  final String? foodName;
  final String? unit;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController camController;
  FlashMode _flashMode = FlashMode.off;

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    camController = CameraController(cameras[0], ResolutionPreset.high);
    await camController.initialize();
  }

  Future<void> takePicture() async {
    XFile image = await camController.takePicture();
    // ignore: use_build_context_synchronously
    if (!context.mounted) {
      return;
    }
    if (widget.replaceWhenNavigate) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => EatConfirmPage(
              image: image,
              name: widget.foodName,
              quantity: widget.quantiy,
              unit: widget.unit)));
      return;
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EatConfirmPage(
              image: image,
              name: widget.foodName,
              quantity: widget.quantiy,
              unit: widget.unit)));
    }
  }

  Future<void> getImageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      print("Not get image");
      return;
    }
    // ignore: use_build_context_synchronously
    if (!context.mounted) {
      return;
    }
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EatConfirmPage(
              image: image,
              quantity: widget.quantiy,
              name: widget.foodName,
              unit: widget.unit,
            )));
  }

  @override
  void dispose() {
    camController.dispose();
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
                      child: CameraPreview(
                        camController,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      "ออก",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (_flashMode == FlashMode.off) {
                                        _flashMode = FlashMode.torch;
                                      } else {
                                        _flashMode = FlashMode.off;
                                      }
                                      camController.setFlashMode(_flashMode);
                                    },
                                    icon: const Icon(
                                      Icons.flash_auto_sharp,
                                      color: Colors.white,
                                      size: 30,
                                    ))
                              ],
                            ),
                            Center(
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Image.asset("assets/cameraFrame.png")),
                            ),
                          ],
                        ),
                      ),
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
