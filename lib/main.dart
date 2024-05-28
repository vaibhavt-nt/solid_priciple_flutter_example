import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_priciple_flutter_example/providers/product_provider.dart';
import 'package:solid_priciple_flutter_example/repositories/product_repository.dart';
import 'package:solid_priciple_flutter_example/screens/product_list_screen.dart';
import 'package:solid_priciple_flutter_example/services/product_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(ProductRepository(ProductService())),
      child: MaterialApp(
        title: 'Product Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}