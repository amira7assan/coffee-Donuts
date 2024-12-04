import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/pages/details.dart';
import 'package:mobile_project/widget/VoiceToText.dart';
class ProductSearchDelegate extends SearchDelegate<Product> {
  final List<Product> products;
  final Function(Product) onProductSelected;
  final Function(Product) onAddToCart;
  final Function(Product) onAddToFavorites;
  final Map<Product, bool> isFavorite;

  ProductSearchDelegate({
    required this.products,
    required this.onProductSelected,
    required this.onAddToCart,
    required this.onAddToFavorites,
    required this.isFavorite,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
      VoiceSearchWidget(  // Use the VoiceSearchWidget
        onQueryChanged: (newQuery) {
          query = newQuery;
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
    product.title.toLowerCase().contains(query.toLowerCase()) ||
        product.category.toLowerCase().contains(query.toLowerCase()))
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
                builder: (context) => ProductDetailsPage(
                  product: product,
                  onAddToCart: onAddToCart,
                  onAddToFavorites: onAddToFavorites,
                  isFavorite: isFavorite[product] == true,
                ),
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
    product.title.toLowerCase().contains(query.toLowerCase()) ||
        product.category.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions
          .map(
            (product) => ListTile(
          title: Text(product.title),
          onTap: () {
            onProductSelected(product);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(
                  product: product,
                  onAddToCart: onAddToCart,
                  onAddToFavorites: onAddToFavorites,
                  isFavorite: isFavorite[product] == true,
                ),
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
