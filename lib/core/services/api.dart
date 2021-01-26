import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:takudzwa_interview_project_app/core/providers/account_name_prvider.dart';
import 'package:takudzwa_interview_project_app/core/models/account_item.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_provider.dart';
import 'package:takudzwa_interview_project_app/locator.dart';

class Api {
  static const userId = "UZyMgwSApiN0b148VDrZSAeWkfb2";
  static const url =
      "http://us-central1-momentumtest-bfdef.cloudfunctions.net/app/api/v1/account";

  void parseApiList(parsedDataList) {
    AccountListProvider _accountListProvider = locator<AccountListProvider>();
    for (Map account in parsedDataList) {


      AccountItem _accountItem = AccountItem(
        id: account["id"],
        overdraft: account["overdraft"].toString(),
        dateCreated: account["created"],
        accountNumber: account["accountNumber"],
        userId: account["userId"],
        activeStatus: account["active"],
        balance: account["balance"].toString(),
        dateModified: account["modified"],
        accountName: account["name"],
      );
      _accountListProvider.addAccount(_accountItem);
    }
  }

  Future<void> getAccountList() async {
    try {
      http.Response response =
          await http.get("${url}/findByUserId?userId=$userId");

      String data = response.body;

      var parsedDataList = jsonDecode(data) as List<dynamic>;

      parseApiList(parsedDataList);
    } on SocketException catch (_) {
      print("may not be connected to the internet ");
    } catch (e) {
      print(e);
    }
  }

  Future<AccountItem> getSingleAccount(accountId) async {
    try {

      http.Response response = await http.get("${url}/$accountId");

      String data = response.body;

      var account = jsonDecode(data) as Map;
      AccountItem _accountItem = AccountItem(
        id: account["id"],
        overdraft: account["overdraft"].toString(),
        dateCreated: account["created"],
        accountNumber: account["accountNumber"],
        userId: account["userId"],
        activeStatus: account["active"],
        balance: account["balance"].toString(),
        dateModified: account["modified"],
        accountName: account["name"],
      );

      return _accountItem;
    } on SocketException catch (_) {
      print("may not be connected to the internet ");
    } catch (e) {
      print("there was an error with you request");
      print(e);
    }
  }

  Future<AccountItem> makeDeposit(accountId, amount) async {
    AccountListProvider _accountListProvider = locator<AccountListProvider>();

    try {
       http.Response response =
          await http.post("${url}/deposit/$accountId?amount=$amount");

      String data = response.body;
      print("code is ${response.statusCode}");

      if (response.statusCode == 200) {
        print(response.body);
        print("deposit has successfully been made ");
      }

      AccountItem accountItem = await getSingleAccount(accountId);
      _accountListProvider.modifyAccount(accountItem);
      return accountItem;
    } on SocketException catch (_) {
      print("may not be connected to the internet ");
    } catch (e) {
      print("there was an error with you request");
      print(e);
    }
  }

  Future<AccountItem> makeWithdrawal(accountId, amount) async {
    AccountListProvider _accountListProvider = locator<AccountListProvider>();

    try {
       http.Response response =
          await http.post("$url/withdraw/$accountId?amount=$amount");

      String data = response.body;
      print("code is ${response.statusCode}");

      if (response.statusCode == 200) {

        AccountItem accountItem = await getSingleAccount(accountId);
        _accountListProvider.modifyAccount(accountItem);

        return accountItem;
      }
    } on SocketException catch (_) {
      print("may not be connected to the internet ");
    } catch (e) {
      print("there was an error with you request");
      print(e);
    }
  }

  Future<void> createNewAccount() async {
    String body = jsonEncode({
      "id": getRandString(20).replaceAll("=", ""),
      "userId": userId,
      "name": locator<AccountNameProvider>().accountName,
      "accountNumber": "3425635",
      "balance": 0,
      "overdraft": 0,
      "active": true,
      "created": DateTime.now().toString(),
      "modified": DateTime.now().toString(),
    });

    try {
      http.Response response = await http.put("$url/create", body: body);

      String data = response.body;
      print("code is ${response.statusCode}");

      if (response.statusCode == 200) {
         print("create a new account successfully");
      }
    } on SocketException catch (_) {
      print("may not be connected to the internet ");
    } catch (e) {
      print("there was an error with you request");
      print(e);
    }
  }

  String getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
