class CatagoryModel {
  String name;
  String imageUrl;

  CatagoryModel({required this.name, required this.imageUrl});
}

final List<CatagoryModel> catagories = [
  CatagoryModel(name: 'Snikers', imageUrl: 'images/snikers1.png'),
  CatagoryModel(name: 'Sports', imageUrl: 'images/snikers3.png'),
  CatagoryModel(name: 'Loper', imageUrl: 'images/snikers4.png'),
  CatagoryModel(name: 'LifeStyle', imageUrl: 'images/snikers1.png'),
  CatagoryModel(name: 'Running', imageUrl: 'images/snikers6.png'),
  CatagoryModel(name: 'Football', imageUrl: 'images/snikers5.png'),
  CatagoryModel(name: 'Basket', imageUrl: 'images/snikers7.png'),
  CatagoryModel(name: 'Sandles', imageUrl: 'images/snikers1.png'),
  CatagoryModel(name: 'Boots', imageUrl: 'images/snikers3.png'),
  CatagoryModel(name: 'Walking', imageUrl: 'images/snikers5.png'),
];

List <CatagoryModel> get getCategoriesList{
  return catagories;
}