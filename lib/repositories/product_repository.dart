//SOLID Principle
//D:
// Dependency Inversion Principle (DIP): Depend on abstractions rather than concrete classes
import 'package:solid_priciple_flutter_example/models/product.dart';
import 'package:solid_priciple_flutter_example/services/product_service.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
}

class ProductRepository implements IProductRepository {
  final IProductService _productService;

  ProductRepository(this._productService);

  @override
  Future<List<Product>> getProducts() {
    return _productService.fetchProducts();
  }
}