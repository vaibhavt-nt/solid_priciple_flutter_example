
// SOLID Principle
// I: Interface Segregation Principle (ISP): Define fine-grained interface for product services

// We define a specific interface IProductService that has only the methods related to fetching products.
// This ensures that any class implementing this interface is only required to implement the methods it actually uses.

import 'package:flutter/material.dart';
import 'package:solid_priciple_flutter_example/models/product.dart';

abstract class IProductService {
  // This method should fetch a list of products from some data source (e.g., a remote server).
  // By declaring it in an interface, we can ensure that any class providing product fetching functionality
  // will implement this method.
  Future<List<Product>> fetchProducts();
}

// ProductService implements the IProductService interface.
// This means it provides the specific functionality of fetching products.
class ProductService implements IProductService {
  @override
  Future<List<Product>> fetchProducts() async {
    // Mock fetching products from a remote server
    await Future.delayed(const Duration(seconds: 2));
    return [
      Electronics('Laptop', 999.99),
      Groceries('Apples', 2.99),
    ];
  }
}

// Now, let's suppose we need another service that saves products.
// Instead of adding the saveProduct method to the IProductService interface (which would violate ISP),
// we create a new interface with that specific responsibility.

abstract class IProductSaveService {
  Future<void> saveProduct(Product product);
}

// If we had a class responsible for saving products, it would implement IProductSaveService like this:
class ProductSaveService implements IProductSaveService {
  @override
  Future<void> saveProduct(Product product) async {
    // Mock saving product to a remote server
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('${product.name} saved!');
  }
}
