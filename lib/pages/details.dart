import 'package:flutter/material.dart';
import 'package:mobile_project/models/product.dart';
import 'package:mobile_project/widget/add_to_cart_icon.dart';
import 'package:mobile_project/widget/favourit_icon.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  final Function(Product) onAddToCart;
  final Function(Product) onAddToFavorites;
  final bool isFavorite;

  ProductDetailsPage({
    required this.product,
    required this.onAddToCart,
    required this.onAddToFavorites,
    required this.isFavorite,
  });

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        backgroundColor: const Color(0xffDFA2A6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.product.image, height: 250, width: 250),
            SizedBox(height: 16),
            Text(
              widget.product.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.product.category,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Price: \$${widget.product.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FavoriteIcon(
                  product: widget.product,
                  isFavorite: widget.isFavorite,
                  onToggleFavorite: () => widget.onAddToFavorites(widget.product),
                ),
                AddToCartIcon(
                  product: widget.product,
                  onAddToCart: () => widget.onAddToCart(widget.product),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
