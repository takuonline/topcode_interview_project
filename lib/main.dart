import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_provider.dart';
import 'package:takudzwa_interview_project_app/locator.dart';
import 'package:takudzwa_interview_project_app/ui/views/account_details.dart';
import 'package:takudzwa_interview_project_app/ui/views/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Demo',
      theme: ThemeData(
        textTheme: TextTheme(),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeView.id,
      routes: {
        HomeView.id: (context) => ChangeNotifierProvider(
            create: (BuildContext context) => locator<AccountListProvider>(),
            child: HomeView()),
        AccountDetails.id: (context) => AccountDetails()
      },
    );
  }
}
