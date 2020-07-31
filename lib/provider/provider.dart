import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  List<int> _numbersToSort = new List();
  int _selectedItem = 0;
  int _selectedSecondItem = 0;

  List get numbersToSort => _numbersToSort;

  int get selectedItem => _selectedItem;

  int get selectedSecondItem => _selectedSecondItem;

  set selectedSecondItem(int tmpInt) {
    _selectedSecondItem = tmpInt;
    notifyListeners();
  }

  set selectedItem(int tmpInt) {
    _selectedItem = tmpInt;
    notifyListeners();
  }

  set numbersToSort(List tmpList) {
    _numbersToSort = tmpList;
    notifyListeners();
  }
}
