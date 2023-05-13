import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/eat_confirm.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

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
    );
  }
}
