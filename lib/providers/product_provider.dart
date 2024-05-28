//SOLID Principle
//S:
// Single Responsibility Principle (SRP): Separate business logic from UI
import 'package:flutter/material.dart';
import 'package:solid_priciple_flutter_example/models/product.dart';
import 'package:solid_priciple_flutter_example/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final IProductRepository _productRepository;
  List<Product> _products = [];

  ProductProvider(this._productRepository);

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await _productRepository.getProducts();
    notifyListeners();
  }
}
