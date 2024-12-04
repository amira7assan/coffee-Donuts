import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/pages/details.dart';
class ProductSearchDelegate extends SearchDelegate<Product> {
  final List<Product> products;
  final Function(Product) onProductSelected;

  ProductSearchDelegate({required this.products, required this.onProductSelected});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results
          .map(
            (product) => ListTile(
          title: Text(product.title),
          onTap: () {
            onProductSelected(product);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            ); // Navigate to ProductDetailsPage
          },
        ),
      )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
        product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions
          .map(
            (product) => ListTile(
          title: Text(product.title),
          onTap: () {
            onProductSelected(product); // Handle selection
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            ); // Navigate to ProductDetailsPage
          },
        ),
      )
          .toList(),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Product(id: '', category: '', title: '', price: 0.0, image: ''));
      },
    );
  }
}
