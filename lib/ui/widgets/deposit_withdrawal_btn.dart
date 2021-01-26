import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/services/api.dart';
import 'package:takudzwa_interview_project_app/core/models/transaction_enum.dart';
import 'package:takudzwa_interview_project_app/core/services/transaction_services.dart';
import 'package:takudzwa_interview_project_app/locator.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';

class TransactionBtn extends StatelessWidget {
  final onPressed;
  final String title;
  final accountItem;
  double amount;
  transactionType type;

  TransactionBtn({this.onPressed, this.title, this.accountItem, this.amount,this.type});


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return RaisedButton(
        color: kLightPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * .1)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * .02, horizontal: screenWidth * .1),
          child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
              )),
        ),
        onPressed: () => {

          TransactionServices().showTransactionDialog(context, amount, accountItem, type)

        });
  }
}


class DepositWithdrawalBtn extends StatelessWidget {
  final onPressed;
  final String title;
  final accountItem;

  transactionType type;

  DepositWithdrawalBtn({this.onPressed, this.title, this.accountItem, this.type});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return
    RaisedButton(
        color: kLightPrimaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * .1)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * .02, horizontal: screenWidth * .1),
          child: Text(title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
              )),
        ),
        onPressed: () => TransactionServices().executeTransaction( context, accountItem, type));
  }




}


