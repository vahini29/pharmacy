import 'package:flutter/material.dart';

class CartItems {
  CartItems({
    this.imgPath,
    this.name,
    this.price,
    this.oprice,
    this.count,
  });
  int count, price, oprice;

  final String name, imgPath;
}

class CartDetails extends ChangeNotifier {
  List<CartItems> _items = [];

  List<CartItems> get items {
    return [..._items];
  }

  void cler() {
    _items.clear();
    _itemname.clear();
    _countNO.clear();
    addTotal();
  }

  List<String> _itemname = [];
  List<String> get name {
    retrivenamedata();
    return [..._itemname];
  }

  List<int> _countNO = [];
  List<int> get countno {
    retrivecountdata();
    return [..._countNO];
  }

  void retrivecountdata() {
    for (int i = 0; i < _items.length; i++) {
      _countNO.add(0);
    }
    for (int i = 0; i < _items.length; i++) {
      _countNO[i] = _items[i].count;
    }
  }

  void retrivenamedata() {
    for (int i = 0; i < _items.length; i++) {
      _itemname.add('');
    }
    for (int i = 0; i < _items.length; i++) {
      _itemname[i] = _items[i].name;
    }
  }

  int dup;
  void addItem(CartItems value, BuildContext context) {
    if (checkItem(value)) {
      _items.add(value);
      // _itemname.add(value.name);
    } else {
      dupitem(value);
    }

    addTotal();
    notifyListeners();
    // return true;
  }

  void dupitem(CartItems value) {
    int ip = _items[dup].count;
    ip = ip + value.count;
    _items[dup].count = ip;
    _items[dup].price = _items[dup].oprice * _items[dup].count;
  }

  bool checkItem(CartItems value) {
    int count = 0;
    for (int i = 0; i < items.length; i++) {
      if (_items[i].name == value.name) {
        count++;
        dup = i;
      }
    }
    if (count == 0) {
      return true;
    } else {
      return false;
    }
  }

  int _total1;
  void addTotal() {
    int _total = 0;
    for (int i = 0; i < items.length; i++) {
      _total = _total + _items[i].price;
    }
    _total1 = _total;
    notifyListeners();
  }

  void increaseItemCount(int i) {
    int ip = _items[i].count;
    ip++;
    _items[i].count = ip;
    _items[i].price = _items[i].oprice * _items[i].count;
    addTotal();
  }

  void decreaseItemCount(int i) {
    if (_items[i].count > 0) {
      int ip = _items[i].count;
      ip--;
      _items[i].count = ip;
      if (_items[i].count == 0) {
        _items.removeAt(i--);
        // _itemname.remove(i--);
        addTotal();
      }
      _items[i].price = _items[i].oprice * _items[i].count;
      addTotal();
    }
  }

  int get getTotal {
    if (_total1 == null) {
      return 0;
    } else
      return _total1;
  }
}
