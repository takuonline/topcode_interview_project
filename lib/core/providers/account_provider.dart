import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
class AccountListProvider extends ChangeNotifier {
  List<AccountItem> _accounts = [];

  List<AccountItem> get accounts => _accounts;

  void addAccount(AccountItem value) {
    _accounts.add(value);
    notifyListeners();
  }

  modifyAccount(AccountItem value) {
    for (AccountItem i in _accounts) {
      if (i.id == value.id) {
        i.balance = value.balance;
      }
    }
    notifyListeners();
  }
}
