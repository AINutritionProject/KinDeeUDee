import 'dart:io';
import 'package:appfood2/db.dart';
import 'package:appfood2/pages/add_eat_history.dart';
import 'package:appfood2/pages/all_food.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appfood2/pages/ai_output.dart';
import 'package:image/image.dart' as img;
import 'package:appfood2/screen_size.dart';

class EatConfirmPage extends StatefulWidget {
  const EatConfirmPage({
    super.key,
    required this.image,
    required this.resultFood,
    required this.user,
  });
  final XFile image;
  final Food resultFood;
  final User user;

  @override
  State<EatConfirmPage> createState() => _EatConfirmPageState();
}

class _EatConfirmPageState extends State<EatConfirmPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSizeData = ScreenSizeData(
      screenWidth: mediaQueryData.size.width,
      screenHeight: mediaQueryData.size.height,
    );
    return Scaffold(
      body: Container(
        color: screenSizeData.screenWidth <= screenSizeData.maxWidth
            ? Colors.white
            : Colors.black,
        child: Center(
          child: Container(
            width: screenSizeData.screenSizeWidth,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 320,
                  width: 320,
                  color: Colors.blue,
                  child: Image.file(
                    File(widget.image.path),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    "คุณต้องการรับประทาน\n${widget.resultFood.name}?",
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await SaveEatHistoryToLocal(
                              widget.resultFood.name, 1, 'ส่วน', widget.image);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => AIOutputPage(
                                        foodImage: widget.image,
                                        food: widget.resultFood,
                                        user: widget.user,
                                      )),
                              ModalRoute.withName("/landing"));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(177, 254, 150, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 53,
                          child: const Text(
                            "ใช่",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(250, 138, 138, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 53,
                          child: const Text(
                            "ไม่",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
