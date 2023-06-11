import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;

class TFModel {
  // contructor
  TFModel();

  Map<int, List<dynamic>> outputs = {
    0: List.filled(10, 0.0).reshape([1, 10]),
    1: List.filled(10 * 4, 0.0).reshape([1, 10, 4]),
    2: List.filled(1, 0).reshape([1]),
    3: List.filled(10, 0).reshape([1, 10])
  };
  // load model
  late Interpreter _interpreter;
  final List<String> labels = [];
  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/models/detect.tflite');
  }

  Future<void> init() async {
    await loadModel();
    await loadLabels();
  }

  void close() {
    _interpreter.close();
  }

  Future<void> loadLabels() async {
    // load labels
    labels.clear();
    final rawDate = await rootBundle.loadString("assets/allfood.csv");
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(rawDate);
    for (var row in csvTable) {
      labels.add(row[0]);
    }
  }

  String? runModel(imglib.Image baseImage) {
    // convert image to input tensor
    int imageSize = 320;
    final imglib.Image resizedImage =
        imglib.copyResize(baseImage, width: imageSize, height: imageSize);

    var imageBytes = resizedImage.getBytes();
    var normalizedImageBytes = Float32List(imageBytes.length);
    for (var i = 0; i < normalizedImageBytes.length; i++) {
      normalizedImageBytes[i] = (imageBytes[i] - 127.5) / 127.5;
    }
    var inputs = [
      normalizedImageBytes.reshape([1, imageSize, imageSize, 3])
    ];
    // run model
    _interpreter.runForMultipleInputs(inputs, outputs);
    // get result
    int result = outputs[3]?[0][0].toInt();
    print("raw resource is $result");
    try {
      return labels[result];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
