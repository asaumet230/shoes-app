import 'package:flutter/material.dart';

class ShoesProvider with ChangeNotifier {
  String _assetImage = 'assets/images/azul.png';
  double _size = 9.0;

  get getAssetImage => _assetImage;
  get getSize => _size;

  void setAssetImage(String imagePath) {
    _assetImage = imagePath;
    notifyListeners();
  }

  void setSize(double size) {
    _size = size;
    notifyListeners();
  }
}
