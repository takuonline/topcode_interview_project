import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
import 'package:takudzwa_interview_project_app/core/providers/amount_provider.dart';
import 'package:takudzwa_interview_project_app/core/models/transaction_enum.dart';
import 'package:takudzwa_interview_project_app/locator.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/deposit_withdrawal_btn.dart';

class TransactionDialogSheet {




  Future<void> displayDialog(
      BuildContext context, AccountItem accountItem, onPressed, type) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return draggableSheet(context, accountItem, onPressed, type);
      },
    );
  }

  draggableSheet(BuildContext context, AccountItem accountItem,
      Function onPressed, transactionType type) {

    String btnTitle;
    String dialogTitle;


    switch (type) {
      case transactionType.deposit:
        btnTitle = "Deposit";
        dialogTitle = "Make a Deposit";
        break;

      case transactionType.withdrawal:
        btnTitle = "Withdrawal";
        dialogTitle = "Make a Withdrawal";
        break;

      default:
        print(type);
    }


    return Material(
      color: Colors.transparent,
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) =>
              DraggableScrollableSheet(
                minChildSize: .6,
                initialChildSize: .8,
                maxChildSize: .9,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                    child: Container(
                      color: kLightSecondaryColor,
                      child: SingleChildScrollView(
                        controller: ScrollController(),
                        child: Container(
                          child: Column(children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              dialogTitle,
                              style: TextStyle(fontSize: 30,color: kPrimaryTextColor),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 70),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (String value) {
                                  try {
                                 double amount = double.parse(value) ;
                                  locator<AmountProvider>().addAmount(amount) ;


                                  } on FormatException {
                                    print("wrong text");
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            DepositWithdrawalBtn(
                                type:type,
                                title: btnTitle,
                                accountItem: accountItem,
                             ),

                            SizedBox(
                              height: 80,
                            )


                          ]),
                        ),
                      ),
                    ),
                  );
                },
              )),
    );
  }


}
