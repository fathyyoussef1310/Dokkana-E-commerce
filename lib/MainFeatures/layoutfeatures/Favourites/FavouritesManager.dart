import 'package:flutter/material.dart';

class Favouritesmanager extends ChangeNotifier {
  final List<Map<String, String>> _favitems = [];

  List<Map<String, String>> get items => _favitems;

  void toggleData(String image, String info, String price) {
    int index = _favitems.indexWhere((item) => item['info'] == info);

    if (index != -1) {
      _favitems.removeAt(index);
    } else {
      _favitems.add({
        "image": image,
        "info": info,
        "Price": price,
      });
    }
    notifyListeners();
  }

  bool isExisted(String name) {
    return _favitems.any((item) => item['info'] == name);
  }
}