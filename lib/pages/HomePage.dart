import 'package:flutter/material.dart';
import 'package:mobile_project/pages/AddToCard.dart';
import 'package:mobile_project/widget/bottomNavigationBar.dart';
import 'package:mobile_project/models/cart_iteam.dart';
import '../models/product.dart';
import '../widget/ProductList.dart';
import 'package:mobile_project/models/Cart2.dart';
import 'package:mobile_project/pages/Fav.dart';
import 'package:mobile_project/widget/Search.dart';

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

  // Bottom navigation bar item tapped
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
                  onProductSelected: (product) {
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductList(
          products: _filteredProducts.isEmpty ? myData : _filteredProducts, // Use filtered products or all
          onAddToCart: _addToCart,
          onAddToFavorites: _toggleFavorite,
          isFavorite: _isFavorite,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
