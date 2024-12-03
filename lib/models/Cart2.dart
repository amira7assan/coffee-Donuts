import 'package:mobile_project/models/cart_iteam.dart';
class Cart {
  List<CartItem> items = [];

  void addItem(CartItem cartItem) {
    // Look for an existing item in the cart by product ID
    var existingItem = items.firstWhere(
          (item) => item.product.id == cartItem.product.id,
      orElse: () => CartItem(product: cartItem.product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      // If the product is not found, add the item to the cart
      items.add(cartItem);
    } else {
      // If the product exists, increment its quantity
      existingItem.increaseQuantity();
    }
  }

  double get totalPrice {
    double total = 0.0;
    for (var item in items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
