import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeProvider extends ChangeNotifier {
  int index = 0;

  //set the bottom nav bar current index
  setCurrentIndex(int val) {
    index = val;
    notifyListeners();
  }
}
