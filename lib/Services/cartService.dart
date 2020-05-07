import 'package:flutter/cupertino.dart';

class CartItem {
  ValueNotifier<int> count = ValueNotifier<int>(0);

  increaseCounter() {
    count.value += 1;
  }

  decreasecounter() {
    if (count.value > 0) {
      count.value -= 1;
    }
  }
}
