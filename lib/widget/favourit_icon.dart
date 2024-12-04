import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoriteIcon extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const FavoriteIcon({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onToggleFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
      onPressed: onToggleFavorite,
    );
  }
}
