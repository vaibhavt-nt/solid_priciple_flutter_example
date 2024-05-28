//SOLID Principle
// L:
// Liskov Substitution Principle (LSP): Use a base class for products
abstract class Product {
  final String name;
  final double price;

  Product(this.name, this.price);

  String getDetails();
}

//SOLID Principle
//O:
// Open/Closed Principle (OCP): The Product class is open for extension (by adding new product types like Electronics and Groceries)
// but closed for modification (we don't need to change the Product class to add new product types).

class Electronics extends Product {
  Electronics(super.name, super.price);

  @override
  String getDetails() {
    return 'Electronics: $name, Price: $price';
  }
}

class Groceries extends Product {
  Groceries(super.name, super.price);

  @override
  String getDetails() {
    return 'Groceries: $name, Price: $price';
  }
}