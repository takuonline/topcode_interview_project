import 'package:flutter/material.dart';

class AmountProvider extends ChangeNotifier{
  double _amount;

  double get amount => _amount;

  void addAmount(double value){
    _amount = value;
    notifyListeners();
  }


}