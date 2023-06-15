class ScreenSizeData {
  final double maxWidth = 600;
  final double screenWidth;
  final double screenHeight;

  ScreenSizeData({
    required this.screenWidth,
    required this.screenHeight,
  });

  double get screenSizeWidth =>
      screenWidth > maxWidth ? maxWidth : screenWidth;
}