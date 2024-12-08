import 'package:flutter/material.dart';
import 'package:mobile_project/widget/bottomNavigationBar.dart';
import 'package:mobile_project/models/cart_iteam.dart';
import 'package:mobile_project/pages/Fav.dart';
import 'package:mobile_project/widget/Search.dart';
import '../models/product.dart';
import '../widget/ProductList.dart';
import 'package:mobile_project/models/Cart.dart';
import 'package:mobile_project/pages/AddToCard.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  final Cart _cart = Cart();
  final List<Product> _favorites = [];
  final Map<Product, bool> _isFavorite = {};
  List<Product> _filteredProducts = [];
  String? _selectedCategory;

  // List of categories based on your Product data
  final List<String> categories = ['All', 'Coffee', 'Dessert', 'Tea', 'mix'];

  void _addToCart(Product product) {
    setState(() {
      _cart.addItem(CartItem(product: product, quantity: 1));
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (_isFavorite[product] == true) {
        _isFavorite[product] = false;
        _favorites.remove(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.title} removed from favorites!'),
            duration: const Duration(seconds: 2),
          ),
        );
      } else {
        _isFavorite[product] = true;
        _favorites.add(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.title} added to favorites!'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavouritesPage(
            favouriteProducts: _favorites,
            onRemoveFromFavourites: _toggleFavorite,
          ),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddToCard.go_to_cart(cart: _cart)),
      );
    }
  }

  // Method to filter products by selected category
  void _filterProductsByCategory(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'All') {
        _filteredProducts = myData;
      } else {
        _filteredProducts = myData.where((product) => product.category == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDFA2A6),
        title: const Text('Coffee', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddToCard.go_to_cart(cart: _cart)),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavouritesPage(
                    favouriteProducts: _favorites,
                    onRemoveFromFavourites: _toggleFavorite,
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(
                  products: myData,
                  onProductSelected: (product) {},
                  onAddToCart: _addToCart,
                  onAddToFavorites: _toggleFavorite,
                  isFavorite: _isFavorite,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Dropdown for category selection
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedCategory,
              hint: Text('Select Category'),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _filterProductsByCategory(newValue);
                }
              },
              items: categories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // Display filtered products
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns for better visibility
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75, // Adjust the size of items
                ),
                itemCount: _filteredProducts.isEmpty ? myData.length : _filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = _filteredProducts.isEmpty ? myData[index] : _filteredProducts[index];
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.category,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ), Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                _isFavorite[product] == true ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                              ),
                              onPressed: () => _toggleFavorite(product),
                            ),
                            IconButton(
                              icon: Icon(Icons.add_shopping_cart, color: Colors.black),
                              onPressed: () => _addToCart(product),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
