// ignore_for_file: prefer_final_fields

import 'package:favorites_management/model/product.dart';
import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Product> _bookmarkItems = [];

  List<Product> get bookmarkItems => _bookmarkItems;

  void addBookmarkItems(Product product) {
    _bookmarkItems.add(product);
    notifyListeners();
  }

  void setBookmarkItems(List<Product> product) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bookmarkItems = product;
      notifyListeners();
    });
  }
}
