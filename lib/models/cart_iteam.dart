import 'product.dart';
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  void increaseQuantity() {
    quantity++;
  }
}

/*
class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}*/
