import 'package:flutter/material.dart';

class CatagoryModel {
  String name;
  String imageUrl;
  int index;
  bool isSelected;

  CatagoryModel(
      {required this.name,
      required this.imageUrl,
      required this.index,
      this.isSelected = false});
}

final List<CatagoryModel> catagories = [
  CatagoryModel(
      name: 'All Shoes',
      imageUrl: 'images/snikers1.png',
      index: 0,
      isSelected: true),
  CatagoryModel(name: 'Snikers', imageUrl: 'images/snikers1.png', index: 1),
  CatagoryModel(name: 'Sports', imageUrl: 'images/snikers3.png', index: 2),
  CatagoryModel(name: 'Loper', imageUrl: 'images/snikers4.png', index: 3),
  CatagoryModel(name: 'Sandals', imageUrl: 'images/snikers1.png', index: 4),
  CatagoryModel(name: 'Boots', imageUrl: 'images/snikers3.png', index: 5),
  CatagoryModel(name: 'Running', imageUrl: 'images/snikers6.png', index: 6),
  CatagoryModel(name: 'Football', imageUrl: 'images/snikers5.png', index: 7),
  CatagoryModel(name: 'Basketball', imageUrl: 'images/snikers7.png', index: 8),
  CatagoryModel(name: 'Kids', imageUrl: 'images/snikers5.png', index: 9),
  CatagoryModel(name: 'Womens', imageUrl: 'images/snikers1.png', index: 10),
];

List<CatagoryModel> get getCategoriesList {
  return catagories;
}

class Settings {
  String name;
  String iconurl;
  Settings(this.name, this.iconurl);
}

final List<Settings> settingslist = [
  Settings('Edit Profile', 'Icons.settings'),
  Settings('Shoping address', 'Icons.settings'),
  Settings('Wishlist', 'Icons.settings'),
  Settings('Order history', 'Icons.settings'),
  Settings('Notifications', 'Icons.settings'),
  Settings('Cards', 'Icons.settings'),
];

List<Settings> getSettingsList(){
  return settingslist;
}