import 'package:mobile_project/models/cart_iteam.dart';


class Cart {
  // List to hold cart items
  List<CartItem> _items = [];

  // Get all items in the cart
  List<CartItem> get items => _items;

  // Add item to the cart
  void addItem(CartItem cartItem) {
    var existingItem = _items.firstWhere(
          (item) => item.product.id == cartItem.product.id,
      orElse: () => CartItem(product: cartItem.product, quantity: 0),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity += cartItem.quantity;
    } else {
      _items.add(cartItem);
    }
  }

  // Remove item from the cart
  void removeItem(CartItem cartItem) {
    _items.removeWhere((item) => item.product.id == cartItem.product.id);
  }

  // Calculate the total price of all items in the cart
  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  // Optionally, clear the cart
  void clear() {
    _items.clear();
  }
}
