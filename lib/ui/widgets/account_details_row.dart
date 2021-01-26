import 'package:flutter/material.dart';

class AccountDetailsRow extends StatelessWidget {


  final String title;
  final figure;

  AccountDetailsRow({this.title, this.figure});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;


    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * .05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
              )),
          Text("$figure",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * .05,
              )),
        ],
      ),

    );
  }
}