import 'dart:typed_data';

import 'package:appfood2/pages/all_food.dart';
import 'package:appfood2/pages/food_detailed.dart';
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
  late List<String> labels;
  late Map<String, Food> foodMap;
  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/models/detect.tflite');
  }

  Future<void> init() async {
    await loadModel();
    labels = await loadLabels();
    await loadFoodMap();
  }

  void close() {
    _interpreter.close();
  }

  Future<List<String>> loadLabels() async {
    // load labels
    List<String> labels = [];
    final rawDate = await rootBundle.loadString("assets/models/labelmap.txt");
    final labelsList = rawDate.split("\n");
    for (var label in labelsList) {
      labels.add(label.trim());
    }
    return labels;
  }

  Future<void> loadFoodMap() async {
    // load labels
    final rawData = await rootBundle.loadString("assets/allfood.csv");
    Map<String, Food> foodMap = {};
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(rawData);
    for (var row in csvTable) {
      final food = Food(
          name: row[1],
          type: row[11],
          detail: FoodNutritionDetail(
            name: row[3].toString().replaceAll("_", ","),
            giIndex: row[5],
            benefit: row[9],
            power: row[6],
            fiber: row[7],
            sugar: row[8],
            protein: row[12],
            fat: row[13],
            carbo: row[14],
            nutrition: row[10],
            realImageAssetPath: "assets/images/Real${row[11]}/" + row[4],
          ),
          imageAssetPath:
              "assets/images/${row[11] == 'Fruit' ? 'Fruit' : 'RiceFlour'}/" +
                  row[2]);
      foodMap[row[0].toString().trim()] = food;
    }
    this.foodMap = foodMap;
  }

  Food? runModel(imglib.Image baseImage) {
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
    print("raw resource is $result, label is ${labels[result]}");
    print(foodMap[labels[result]]);
    try {
      return foodMap[labels[result]];
    } catch (e) {
      print(e);
      return null;
    }
  }
}
