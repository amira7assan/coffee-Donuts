
import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
class FavouritesPage extends StatelessWidget {
  final List<Product> favouriteProducts;
  final Function(Product) onRemoveFromFavourites;

  const FavouritesPage({
    Key? key,
    required this.favouriteProducts,
    required this.onRemoveFromFavourites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        backgroundColor: const Color(0xffDFA2A6),
      ),
      body: favouriteProducts.isEmpty
          ? const Center(
        child: Text(
          "No favourite items yet!",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: favouriteProducts.length,
        itemBuilder: (context, index) {
          final product = favouriteProducts[index];
          return Card(
            elevation: 3,
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: IconButton(
                              icon: const Icon(Icons.favorite),
                              color: Colors.red,
                              onPressed: () {
                                onRemoveFromFavourites(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${product.title} removed from favourites'),
                                  ),
                                );
                              },
                            ),
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
      ),
    );
  }
}
