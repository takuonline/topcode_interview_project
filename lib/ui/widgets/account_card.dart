import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';
import 'package:takudzwa_interview_project_app/ui/views/account_details.dart';


class AccountCard extends StatelessWidget {
  AccountItem accountItem;

  AccountCard({this.accountItem});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
//        Navigator.pushNamed(context, AccountDetails.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountDetails(
              accountItem: accountItem,

            ),
          ),
        );
      },
      child: Material(
        color: Colors.transparent,
        elevation: 40,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .05, vertical: screenHeight * .03),
          height: screenHeight * .3,
          width: screenWidth * .8,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(constraints.maxWidth * .03),
                        gradient: LinearGradient(colors: [
                          kLightPrimaryColor,
                          kLightPrimaryColor
                         ]),
                        color: Colors.blue),
                  ),
                  Positioned(
                    top: constraints.maxHeight * .11,
                    left: constraints.maxWidth * .05,
                    child: Text(
                      " ${accountItem.accountName ?? "No Name"} ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: constraints.maxWidth * .05,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Positioned(
                    bottom: constraints.maxHeight * .2,
                    right: constraints.maxWidth * .07,
                    child: Text(
                      "R${accountItem.balance?? "-"}",
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: constraints.maxWidth * .08,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Positioned(
                    bottom: constraints.maxHeight * .1,
                    right: constraints.maxWidth * .07,
                    child: Text(
                      "Available Balance",
                      style: TextStyle(
                        color: Colors.white.withOpacity(.8),
                        fontSize: constraints.maxWidth * .03,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}