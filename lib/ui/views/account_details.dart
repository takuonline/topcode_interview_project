import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
import 'package:takudzwa_interview_project_app/core/providers/amount_provider.dart';
import 'package:takudzwa_interview_project_app/core/models/transaction_enum.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/account_details_row.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/deposit_withdrawal_btn.dart';

class AccountDetails extends StatelessWidget {
  static const id = "/accountDetails";

  final AccountItem accountItem;

  AccountDetails({this.accountItem});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_)=> AmountProvider(),
        child: Container(
          color: kDarkPrimaryColor,
          child: ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Positioned(
                      left: screenWidth * .05,
                      top: screenHeight * 0.06,
                      child: Container(
                        width: screenWidth * .1,
                        height: screenWidth * .1,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * .02),
                            color: kLightSecondaryColor),
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * .07),
                    child: Center(
                      child: Text("${accountItem.accountName}",
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontSize: screenWidth * .07,
                              decoration: TextDecoration.none)),
                    ),
                  ),
                ],
              ),
              Container(
                  height: screenHeight * .8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kDarkSecondaryColor,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(screenWidth * .1))),
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      AccountDetailsRow(
                        title: "Balance",
                        figure: "R ${accountItem.balance}",
                      ),
                      Spacer(flex: 1),
                      AccountDetailsRow(
                        title: "Account Number",
                        figure: "${accountItem.accountNumber}",
                      ),
                      Spacer(flex: 1),
                      AccountDetailsRow(
                        title: "Overdraft",
                        figure: "${accountItem.overdraft}",
                      ),
                      Spacer(flex: 1),
                      AccountDetailsRow(
                        title: "Status",
                        figure:
                            "${accountItem.activeStatus ? "Active" : "Inactive"}",
                      ),
                      Spacer(
                        flex: 5,
                      ),
                      TransactionBtn(
                          title: "Deposit Amount",
                          accountItem: accountItem,
                        type: transactionType.deposit,

                      ),
                      Spacer(
                        flex: 1,
                      ),
                      TransactionBtn(
                          title: "Withdraw Amount",
                          accountItem: accountItem,
                         type: transactionType.withdrawal,

                          ),
                      Spacer(
                        flex: 2,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }




}
