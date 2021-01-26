
import 'package:flutter/material.dart';

class AccountNameProvider extends ChangeNotifier{
  String _accountName;

  String get accountName => _accountName;

  void addAccountName(String value){
    _accountName = value;
    notifyListeners();
  }


}