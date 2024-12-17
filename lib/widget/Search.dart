import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/pages/details.dart';
import 'package:mobile_project/widget/VoiceToText.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

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
      VoiceSearchWidget(
        onQueryChanged: (newQuery) {
          query = newQuery;
        },
      ),
      IconButton(
        onPressed: () async {
          // Open Barcode Scanner and wait for result
          final barcodeResult = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BarcodeScannerScreen(),
            ),
          );

          if (barcodeResult != null) {
            query = barcodeResult; // Set query to barcode result
            showResults(context); // Show search results
          }
        },
        icon: const Icon(Icons.barcode_reader), // Use a valid icon
      ),

    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
    product.id.toLowerCase().contains(query.toLowerCase()) ||
        product.title.toLowerCase().contains(query.toLowerCase()) ||
        product.category.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results
          .map(
            (product) => ListTile(
          title: Text(product.title),
          subtitle: Text('Category: ${product.category}'),
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
    product.id.toLowerCase().contains(query.toLowerCase()) ||
        product.title.toLowerCase().contains(query.toLowerCase()) ||
        product.category.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions
          .map(
            (product) => ListTile(
          title: Text(product.title),
          subtitle: Text('Category: ${product.category}'),
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

class BarcodeScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan Barcode")),
      body: MobileScanner(
        onDetect: (BarcodeCapture capture) {
          if (capture.barcodes.isNotEmpty) {
            final barcode = capture.barcodes.first.rawValue;
            if (barcode != null) {
              Navigator.of(context).pop(barcode);
            }
          }
        },
      ),
    );
  }
}
