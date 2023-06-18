import 'dart:io';

import 'package:appfood2/ai.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/eat_confirm.dart';
import 'package:image/image.dart' as img;
import 'package:camera/camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
  });

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> cameras;
  late CameraController camController;
  FlashMode _flashMode = FlashMode.off;
  final TFModel _tfModel = TFModel();

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    camController = CameraController(cameras[0], ResolutionPreset.high);
    await _tfModel.init();
    await camController.initialize();
  }

  Future<void> _next(XFile image) async {
    final img.Image decodeImage =
        img.decodeImage(File(image.path).readAsBytesSync())!;
    try {
      final result = await _tfModel.runModel(decodeImage);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EatConfirmPage(
                image: image,
                resultFood: result!,
              )));
    } catch (error) {
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("ไม่พบข้อมูล"),
              content: Text("กรุรณาลองใหม่อีกครั้ง"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("ตกลง"))
              ],
            );
          });
    }
  }

  Future<void> takePicture() async {
    XFile image = await camController.takePicture();
    if (!context.mounted) {
      return;
    }
    _next(image);
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
    _next(image);
  }

  @override
  void dispose() {
    camController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                return Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: SizedBox(
                              height: 620,
                              width: 620,
                              child: CameraPreview(
                                camController,
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
                    ),
                    Center(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.asset("assets/cameraFrame.png")),
                    ),
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
                      child: Container(
                        color: Colors.red,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
