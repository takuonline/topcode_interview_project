import 'package:get_it/get_it.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_name_prvider.dart';
import 'package:takudzwa_interview_project_app/core/providers/account_provider.dart';
import 'package:takudzwa_interview_project_app/core/providers/amount_provider.dart';
import 'package:takudzwa_interview_project_app/core/services/api.dart';
import 'package:takudzwa_interview_project_app/core/services/transaction_services.dart';
import 'package:takudzwa_interview_project_app/ui/views/home_view.dart';
import 'package:takudzwa_interview_project_app/ui/widgets/new_account_dialog_sheet.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AccountListProvider());
  locator.registerLazySingleton(() => TransactionServices());
  locator.registerLazySingleton(() => AmountProvider());
  locator.registerLazySingleton(() => NewAccountDialogSheet());
  locator.registerLazySingleton(() => AccountNameProvider());
  locator.registerLazySingleton(() => HomeView());

}