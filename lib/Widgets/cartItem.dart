import 'package:flutter/foundation.dart';

class cartItem{
  final String id;
  final String name;
  final int quantity;
  final double price;

  cartItem({required this.id, required this.name,required this.price,required this.quantity});
}

class Cart with ChangeNotifier{
  Map<String, cartItem> _items = {};
  Map<String, cartItem> get items{
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String pdtId, String name, double price){
    if(_items.containsKey(pdtId)){
      _items.update(pdtId, (existingCartItem) => cartItem(
          id: DateTime.now().toString(), name: existingCartItem.name,
          price: existingCartItem.price, quantity: existingCartItem.quantity+1));
    }
    else{
      _items.putIfAbsent(pdtId, () => cartItem(name: name, id: DateTime.now().toString(),
          quantity: 1,
          price: price));
    }

    notifyListeners();
  }

  void rmvItem(String id){
    _items.remove(id);
    notifyListeners();
  }

  void rmvSingleItem(String id){
    if(_items.containsKey(id)){
      return;
    }
    if(_items[id]?.quantity!=null){
      if(_items[id]!.quantity > 1){
        _items.update(id, (existingCartItem) => cartItem(
            id: DateTime.now().toString(), name: existingCartItem.name,
            price: existingCartItem.price, quantity: existingCartItem.quantity-1));
      }}
    notifyListeners();
  }

  double get totalAmount{
    var total= 0.0;
    _items.forEach((key, cartItem) {
      total+= cartItem.price + cartItem.quantity;
    });
    return total;
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

}