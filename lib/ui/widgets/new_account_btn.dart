import 'package:flutter/material.dart';
import 'package:takudzwa_interview_project_app/core/services/transaction_services.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';

class NewAccountBtn extends StatelessWidget {

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
            child: Text("New Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * .05,
                )),
          ),
          onPressed: ()  {
           TransactionServices().createNewAccount(context);

          }


      );
  }




}