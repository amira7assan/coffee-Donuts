import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:mobile_project/pages/details.dart';
class ProductList extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onAddToCart;
  final Function(Product) onAddToFavorites;
  final Map<Product, bool> isFavorite;

  const ProductList({
    Key? key,
    required this.products,
    required this.onAddToCart,
    required this.onAddToFavorites,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(product: product),
                      ),
                    );
                  },
                  child: Image.asset(
                    product.image,//width: 300,height: 300
                     fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorite[product] == true ? Colors.red : Colors.grey,
                            ),
                            onPressed: () => onAddToFavorites(product),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart),
                          onPressed: () => onAddToCart(product),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
