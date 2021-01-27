import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_name_prvider.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_provider.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
import 'package:takudzwa_interview_project_app/core/services/api.dart';
import 'package:takudzwa_interview_project_app/locator.dart';
import 'package:takudzwa_interview_project_app/ui/constants/colors.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/account_card.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/new_account_dialog_sheet.dart';

class HomeView extends StatefulWidget {
  static const id = "/";

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<AccountItem> accountsList = [];

  @override
  void initState() {
    super.initState();
    _getApiData();
  }

  void _getApiData() async {
    await locator<Api>().getAccountList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    accountsList = locator<AccountListProvider>().accounts;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => AccountNameProvider(),
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kDarkPrimaryColor, kDarkSecondaryColor])),
            child: ListView(shrinkWrap: true, children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .05,
                    vertical: screenHeight * .05),
                child: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * .1,
                      decoration: TextDecoration.none),
                ),
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              if (accountsList.isEmpty)
                Center(child: CircularProgressIndicator()),
              ...accountsList
                  .map(
                    (e) => AccountCard(
                      accountItem: e,
                    ),
                  )
                  .toList()
            ]),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kLightSecondaryColor,
        onPressed: () =>
            locator<NewAccountDialogSheet>().displayDialog(context),
        child: Icon(
          Icons.add,
          size: screenWidth * .08,
        ),
      ),
    );
  }
}
