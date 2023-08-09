class CatagoryModel {
  String name;
  String imageUrl;
  int index;
  bool isSelected;

  CatagoryModel(
      {required this.name, required this.imageUrl, required this.index,this.isSelected = false});
}

final List<CatagoryModel> catagories = [
  CatagoryModel(name: 'Snikers', imageUrl: 'images/snikers1.png', index: 0),
  CatagoryModel(name: 'Sports', imageUrl: 'images/snikers3.png', index: 1),
  CatagoryModel(name: 'Loper', imageUrl: 'images/snikers4.png', index: 2),
  CatagoryModel(name: 'Sandals', imageUrl: 'images/snikers1.png', index: 3),
  CatagoryModel(name: 'Boots', imageUrl: 'images/snikers3.png', index: 4),
  CatagoryModel(name: 'Running', imageUrl: 'images/snikers6.png', index: 5),
  CatagoryModel(name: 'Football', imageUrl: 'images/snikers5.png', index: 6),
  CatagoryModel(name: 'Basketball', imageUrl: 'images/snikers7.png', index: 7),
  CatagoryModel(name: 'Walking', imageUrl: 'images/snikers5.png', index: 8),
  CatagoryModel(name: 'Custom', imageUrl: 'images/snikers1.png', index: 9),
];

List<CatagoryModel> get getCategoriesList {
  return catagories;
}
