
class AccountItem {

  String id;
  String overdraft;//double
  String  dateCreated;
  String accountNumber;
  String userId;
  bool activeStatus;
  String balance ; //double
  String dateModified;
  String accountName;

  AccountItem(
    {  this.id,
      this.overdraft,
      this.dateCreated,
      this.accountNumber,
      this.userId,
      this.activeStatus,
      this.balance,
      this.dateModified,
      this.accountName
    });



}