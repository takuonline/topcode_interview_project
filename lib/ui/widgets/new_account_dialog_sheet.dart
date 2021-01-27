import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_name_prvider.dart';
import 'package:takudzwa_interview_project_app/locator.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/new_account_btn.dart';

class NewAccountDialogSheet {
  Future<void> displayDialog(
    BuildContext context,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return draggableSheet(context);
      },
    );
  }

  draggableSheet(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight10p =
        screenHeight * (10 / MediaQuery.of(context).size.height);
    final screenWidth10p =
        screenWidth * (10 / MediaQuery.of(context).size.width);

    return Material(
      color: Colors.transparent,
      child: DraggableScrollableSheet(
        minChildSize: .6,
        initialChildSize: .8,
        maxChildSize: .9,
        builder: (BuildContext context, ScrollController scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: Container(
              color: kLightSecondaryColor,
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Container(
                  child: Column(children: [
                    SizedBox(
                      height: screenHeight10p * 3,
                    ),
                    Text(
                      "Create a new account",
                      style: TextStyle(
                          fontSize: screenWidth10p * 3,
                          color: kPrimaryTextColor),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("Name of the account"),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth10p * 7),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.center,
                        onChanged: (String value) {
                          locator<AccountNameProvider>().addAccountName(value);

                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight10p * 4,
                    ),
                    NewAccountBtn(),
                    SizedBox(
                      height: screenHeight10p * 28,
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
