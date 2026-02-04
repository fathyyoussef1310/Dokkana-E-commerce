import 'package:flutter/material.dart';

class Favouritesmanager extends ChangeNotifier{
  List<Map<String,String>> fav=[];
  List<Map<String,String>> get items => fav;
  void toggelData(String image,String info,String Price){
    int index= fav.indexWhere((item)=> item['info'] == info);
    if(index != -1){
      fav.removeAt(index);
    }else {
      fav.add({
        'image': image,
        'info': info,
        'Price': Price,
      });
      notifyListeners();
    }
  }
  bool isExisted(String Price,String info,String image){
    return fav.any((item)=>item['price'] == Price && item['info']==info && item['image']==image);
  }
}