import 'package:flutter/foundation.dart';
import 'cart_item.dart';

class CartService {
  CartService._private();
  static final CartService instance = CartService._private();

  final ValueNotifier<List<CartItem>> items = ValueNotifier<List<CartItem>>([]);

  void addItem(CartItem item) {
    final list = List<CartItem>.from(items.value);
    final index = list.indexWhere((e) => e.id == item.id);
    if (index >= 0) {
      final existing = list[index];
      list[index] = existing.copyWith(quantity: existing.quantity + item.quantity);
    } else {
      list.add(item);
    }
    items.value = list;
  }

  void updateQuantity(String id, int quantity) {
    final list = List<CartItem>.from(items.value);
    final index = list.indexWhere((e) => e.id == id);
    if (index >= 0) {
      if (quantity <= 0) {
        list.removeAt(index);
      } else {
        list[index] = list[index].copyWith(quantity: quantity);
      }
      items.value = list;
    }
  }

  void removeItem(String id) {
    final list = List<CartItem>.from(items.value)..removeWhere((e) => e.id == id);
    items.value = list;
  }

  void clear() {
    items.value = [];
  }
}
