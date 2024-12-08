import 'package:mobile_project/models/cart_iteam.dart';


class Cart {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

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

  void removeItem(CartItem cartItem) {
    _items.removeWhere((item) => item.product.id == cartItem.product.id);
  }

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  void clear() {
    _items.clear();
  }
}
