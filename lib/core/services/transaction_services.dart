import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/providers/amount_provider.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
import 'package:takudzwa_interview_project_app/core/services/api.dart';
import 'package:takudzwa_interview_project_app/core/models/transaction_enum.dart';
import 'package:takudzwa_interview_project_app/locator.dart';
import 'package:takudzwa_interview_project_app/ui/views/account_details.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/transaction_dialog_sheet.dart';

class TransactionServices {
  void showTransactionDialog(
    BuildContext context,
    double amount,
    AccountItem accountItem,
    transactionType type,
  ) {
    TransactionDialogSheet().displayDialog(context, accountItem, amount, type);
  }

  void executeTransaction(
      BuildContext context, AccountItem accountItem, transactionType type) {
    switch (type) {
      case transactionType.deposit:
        depositAmount(context, accountItem);
        break;

      case transactionType.withdrawal:
        withdrawAmount(context, accountItem);
        break;

      default:
        print(type);
    }
  }

  void depositAmount(BuildContext context, AccountItem accountItem) async {
    double amount = locator<AmountProvider>().amount;

    Api api = locator<Api>();

    AccountItem updatedAccount = await api.makeDeposit(accountItem.id, amount);

    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AccountDetails(
          accountItem: updatedAccount,
        ),
      ),
    );
  }

  void withdrawAmount(BuildContext context, AccountItem accountItem) async {
    double amount = locator<AmountProvider>().amount;

    Api api = locator<Api>();

    AccountItem updatedAccount =
        await api.makeWithdrawal(accountItem.id, amount);

    Navigator.pop(context);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AccountDetails(
          accountItem: updatedAccount,
        ),
      ),
    );
  }

  void createNewAccount(BuildContext context) {
    Api api = locator<Api>();
    api.createNewAccount();
    Navigator.pop(context);
  }
}
