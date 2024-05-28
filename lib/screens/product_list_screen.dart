import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solid_priciple_flutter_example/providers/product_provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: FutureBuilder(
        future: productProvider.fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: productProvider.products.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(productProvider.products[index].getDetails()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
