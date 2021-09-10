import 'package:flutter/material.dart';
import 'poroduct.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id : 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl:
            'https://images.sportsdirect.com/images/products/36206203_l.jpg'),
    Product(
      id: 'p3',
      title: 'Scarf',
      description: 'Scarf for the cold weather',
      price: 29.99,
      imageUrl:
          'https://www.barts.eu/img/1080/1920/resize/4/9/4921_vincent-scarf_19_1.png',
    ),
    Product(
        id: 'p4',
        title: 'Pan',
        description: 'A nice pan for eggs',
        price: 59.99,
        imageUrl:
            'https://www.zilan.com.tr/Upload/Dosyalar/resim-jpg/zln1945-zln1952-zln1969-zln197-818bc0c9-a40e-4f18-8e0a-ba643478612d.jpg'),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  void addProduct() {
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
