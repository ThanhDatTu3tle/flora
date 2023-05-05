import 'package:flora/models/Flower.dart';
import 'package:flutter/widgets.dart';

class FlowersVM with ChangeNotifier {
  List<FlowerModel> lst = [];

  add(FlowerModel mo) {
    lst.add(mo);
    notifyListeners();
  }

  delete(int index) {
    lst.removeAt(index);
    notifyListeners();
  }
}